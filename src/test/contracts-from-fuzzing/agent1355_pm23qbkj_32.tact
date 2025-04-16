struct SerializeEdge {
    a: Int as uint1;
    b: Int as int257;
}

contract SerializationEdgeHolder {
    s: SerializeEdge;
    init() {
        self.s = SerializeEdge{
            a: 1,
            b: 0
        };
    }
}