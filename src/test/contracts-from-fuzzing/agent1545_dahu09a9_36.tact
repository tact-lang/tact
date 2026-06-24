struct OptSer {
    x: Int? as uint32;
}

contract OptionalStructSerialize {
    data: OptSer;

    init() {
        self.data = OptSer{ x: null };
    }
}
