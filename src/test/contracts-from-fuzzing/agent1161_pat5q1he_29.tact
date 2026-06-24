struct SerializationEdge {
    val: Int as uint1;
}

contract SerializeMin {
    data: SerializationEdge;

    init() {
        self.data = SerializationEdge{ val: 1 };
    }
}