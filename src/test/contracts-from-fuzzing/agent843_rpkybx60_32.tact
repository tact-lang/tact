struct A {
    a: Int?;
}
struct B {
    b: A?;
}
contract NullableNested {
    q: B?;
    init() {
        self.q = null;
    }
}
