from prga import *
from prga.core.context import *
from prga.netlist.net.util import NetUtils
from prga.compatible import *
from itertools import chain
from bitarray import bitarray
from prga.passes.test import Tester
import networkx as nx
import matplotlib.pyplot as plt
ctx = Context.unpickle("ctx.pkl")
clb= ctx._database[0,"clb"]
cluster= ctx._database[0,"cluster"]
subarray= ctx._database[1,"subarray"]
tile_clb= ctx._database[1,"tile_clb"]

cluster_i0 = clb._instances[('cluster',0)]
ff = cluster_i0.model._instances['ff']
D = ff.pins['D']
# for sink_bus in chain(iter(oport for oport in itervalues(cluster.ports) if oport.direction.is_output),
#                      iter(ipin for instance in itervalues(cluster.instances) for ipin in itervalues(instance.pins) if ipin.model.direction.is_input)):
#     for sink_net in sink_bus:
#         for src_net in NetUtils.get_multisource(sink_net):
#             conn = NetUtils.get_connection(src_net,sink_net)
#             cfg_bits = conn.get("cfg_bits",tuple())
#             print("Conn::",src_net,"->",sink_net,"::",cfg_bits)

# for x in itervalues(clb._instances):
#     if x.model.module_class.is_primitive and x.model.primitive_class.is_lut:
#         print(x)
#         print(x.cfg_bitoffset)
#         print(x.model.cfg_bitcount)

flow = Flow(
        TranslationPass(),
        VerilogCollection('rtl'),
        Tester('rtl','unit_tests')
        )
flow.run(ctx, Scanchain.new_renderer())


# for sink_bus in chain(iter(oport for oport in itervalues(cluster.ports) if oport.direction.is_output),
#                      iter(ipin for instance in itervalues(cluster.instances) for ipin in itervalues(instance.pins) if ipin.model.direction.is_input)):
#     for sink_net in sink_bus:
#         for src_net in NetUtils.get_multisource(sink_net):
#             conn = NetUtils.get_connection(src_net,sink_net)
#             cfg_bits = conn.get("cfg_bits",tuple())
#             print("Conn::",src_net,"->",sink_net,"::",cfg_bits)
# print()
# for sink_bus in chain(iter(oport for oport in itervalues(clb.ports) if oport.direction.is_output),
#                      iter(ipin for instance in itervalues(clb.instances) for ipin in itervalues(instance.pins) if ipin.model.direction.is_input)):
#     for sink_net in sink_bus:
#         for src_net in NetUtils.get_multisource(sink_net):
#             conn = NetUtils.get_connection(src_net,sink_net)
#             cfg_bits = conn.get("cfg_bits",tuple())
#             print("Conn::",src_net,"->",sink_net,"::",cfg_bits)
# print()
# for instance in itervalues(subarray._instances):
#     if instance.model.module_class.is_cluster:
#         for sink_bus in chain(iter(oport for oport in itervalues(instance.model.ports) if oport.direction.is_output),
#                             iter(ipin for instance in itervalues(instance.model.instances) for ipin in itervalues(instance.pins) if ipin.model.direction.is_input)):
#             for sink_net in sink_bus:
#                 for src_net in NetUtils.get_multisource(sink_net):
#                     conn = NetUtils.get_connection(src_net,sink_net)
#                     cfg_bits = conn.get("cfg_bits",tuple())
#                     print("Conn::",src_net,"->",sink_net,"::",cfg_bits)
#         print()
G=nx.Graph()
for sink_bus in chain(iter(oport for oport in itervalues(tile_clb.ports) if oport.direction.is_output),
                     iter(ipin for instance in itervalues(tile_clb.instances) for ipin in itervalues(instance.pins) if ipin.model.direction.is_input)):
    for sink_net in sink_bus:
        for src_net in NetUtils.get_source(sink_net):
                # G.add_edge(src_net.anem, sink_net)
        #     conn = NetUtils.get_connection(src_net,sink_net)
        #     cfg_bits = conn.get("cfg_bits",tuple())
        #     print("Conn::",src_net,"->",sink_net)
# nx.draw(G)
# plt.savefig("tile_clb.png")
# print()
# print(tile_clb._instances)