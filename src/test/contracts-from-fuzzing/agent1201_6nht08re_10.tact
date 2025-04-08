struct Inner {
    a: Int;
}

struct Outer {
    foo: Int;
    nested: Inner;
}

contract ManyFieldsTest {
    f1: Int;
    f2: Int;
    f3: Outer;
    f4: Bool;
    f5: Slice;
    f6: Cell;
    f7: Address;
    f8: String;
    f9: Inner;

    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = Outer{ foo: 3, nested: Inner{a:30} };
        self.f4 = true;
        self.f5 = emptyCell().asSlice();
        self.f6 = emptyCell();
        self.f7 = myAddress();
        self.f8 = "test";
        self.f9 = Inner{a:99};
    }
}