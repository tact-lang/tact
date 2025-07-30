struct NestedStruct1 {
    a: Int = 1;
}

struct NestedStruct2 {
    b: Bool = false;
}

contract ManyNested {
    s1: NestedStruct1;
    s2: NestedStruct2;

    init() {
        self.s1 = NestedStruct1{ a: 42 };
        self.s2 = NestedStruct2{ b: true };
    }
}