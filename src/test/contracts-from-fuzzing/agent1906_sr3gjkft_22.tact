// test persistence of optional string initialized to null
contract NullStringOpt {
    s: String?;

    init() {
        self.s = null;
    }
}
