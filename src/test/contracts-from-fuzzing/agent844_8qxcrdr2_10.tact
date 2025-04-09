struct StructA {
    a: Int;
}

struct StructB {
    b: Bool;
}

contract MultipleStructsDiffTypes {
    one: StructA;
    two: StructB;
    num: Int;
    flag: Bool;

    init() {
        self.one = StructA{ a: 123 };
        self.two = StructB{ b: false };
        self.num = 456;
        self.flag = true;
    }

    receive() {
        let _ = self.one;
        let _ = self.two;
    }
}
