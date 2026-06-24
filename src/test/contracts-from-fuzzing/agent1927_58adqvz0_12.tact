struct Sub1 {
    x: Int?;
    y: Bool;
}

struct Sub2 {
    z: String;
    t: Sub1;
}

contract NestedOptionalFields {
    s: Sub2?;

    init() {
        self.s = null;
    }
}