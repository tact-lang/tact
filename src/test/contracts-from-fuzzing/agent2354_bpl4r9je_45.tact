struct A {
    a: Int?
}

struct B {
    b: A?;
}

contract OptionalDeep {
    deep: B?;

    init() {
        self.deep = null;
    }
}