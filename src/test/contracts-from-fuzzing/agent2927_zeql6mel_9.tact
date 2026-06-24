struct StructOne { val1: Int; }
struct StructTwo { val2: Int; }
struct StructThree { val3: Int; }

contract ManyStructs {
    a: StructOne;
    b: StructTwo;
    c: StructThree;

    init() {
        self.a = StructOne{ val1: 1 };
        self.b = StructTwo{ val2: 2 };
        self.c = StructThree{ val3: 3 };
    }
}