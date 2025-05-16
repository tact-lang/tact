struct InnerOne {
    a: Int;
    b: String;
}

struct InnerTwo {
    x: Bool;
    y: Int?;
}

contract MultiTypeFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: InnerOne;
    f5: InnerTwo;

    init() {
        self.f1 = 42;
        self.f2 = true;
        self.f3 = "hello";
        self.f4 = InnerOne{ a: 1, b: "b" };
        self.f5 = InnerTwo{ x: false, y: null };
    }
}