struct Inner {
    a: Int as uint32;
    b: Bool?;
}

contract OptionalAndSerialization {
    s: Inner;

    init() {
        self.s = Inner{a:42, b:null};
    }
}