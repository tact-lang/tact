struct OptionalSer {
    a: Int? as uint32;
}

contract Test17 {
    os: OptionalSer;

    init() {
        self.os = OptionalSer{ a: null };
    }
}