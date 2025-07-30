struct StrNest {
    s: String;
}

struct IntNest {
    val: Int;
}

contract MultipleStructs {
    one: StrNest;
    two: IntNest;

    init() {
        self.one = StrNest{ s: "hi" };
        self.two = IntNest{ val: 12 };
    }
}