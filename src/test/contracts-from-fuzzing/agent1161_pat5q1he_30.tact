struct SerializationEdge {
    val: Int as int257;
}

contract SerializeMax {
    data: SerializationEdge;

    init() {
        self.data = SerializationEdge{ val: -1 };
    }
}