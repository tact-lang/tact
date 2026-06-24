struct OptSer {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptSerStorage {
    s: OptSer;

    init() {
        self.s = OptSer{ a: null, b: null, c: null };
    }
}
