// test serialization hints interleaving
struct SerializerTricky {
    si8: Int as int8;
    su40: Int as uint40;
    si1: Int as int1;
    su1: Int as uint1;
    si257: Int as int257;
}

contract SerializationEdge {
    tricky: SerializerTricky;
    
    init() {
        self.tricky = SerializerTricky{si8: -1, su40: 10000, si1: 1, su1: 1, si257: -123};
    }
}