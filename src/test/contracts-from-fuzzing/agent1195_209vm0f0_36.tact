struct INested {
    a: Int as uint32;
    b: Bool?;
    c: String;
}

contract NestedOptInits {
    f: INested?;

    init() {
        self.f = null;
    }
}
