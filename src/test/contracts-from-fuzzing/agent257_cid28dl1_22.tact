struct A {
    x: Int?;
    y: String?;
}

struct B {
    a: A?;
}

contract OptionalNestedStruct {
    b: B = B{ a: null };
    init() {}
}