struct A {
    x: Int?;
}
struct B {
    y: A?;
}

contract OptNestedStruct {
    data: B;

    init() {
        self.data = B{ y: null };
    }
}
