struct Compose {
    aa: A;
    bb: B;
}

struct A {
    foo: Int;
}

struct B {
    bar: Bool;
}

contract ComposeTest {
    data: Compose;

    init() {
        self.data = Compose{
            aa: A{foo:7},
            bb: B{bar:true},
        };
    }
}