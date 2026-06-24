struct OptionalAll {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalAllContainer {
    foo: OptionalAll;

    init() {
        self.foo = OptionalAll{ i:null, b:null, s:null };
    }
}