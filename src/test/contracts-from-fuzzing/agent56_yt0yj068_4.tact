struct A {
    value: Int;
}

struct B {
    a: A;
    extra: Int;
}

contract Test {
    mapField: map<Int, B>;

    init() {
        self.mapField = emptyMap();
    }
}