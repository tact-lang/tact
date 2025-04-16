struct NestedBool {
    inner1: Bool;
    inner2: Bool;
}

contract TestManyBools {
    a: Bool;
    b: Bool;
    nest: NestedBool;

    init() {
        self.a = true;
        self.b = false;
        self.nest = NestedBool{ inner1: true, inner2: false };
    }
}