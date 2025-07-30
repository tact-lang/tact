struct A {
    x: Int?;
}

struct B {
    a: A?;
}

contract OptionInStruct {
    data: B;

    init() {
        self.data = B{ a: null };
    }
}