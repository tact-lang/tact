struct StructA {
    a: Int;
}

struct StructB {
    b: Bool;
}

contract MultipleStructsTest {
    one: StructA;
    two: StructB;

    init() {
        self.one = StructA{a:1};
        self.two = StructB{b:true};
    }
}