struct Bar { inner: Int; }

struct Foo {
    barOpt: Bar?;
    intVal: Int;
}

contract MixOptPlain {
    data: Foo;

    init() {
        self.data = Foo {
            barOpt: null,
            intVal: 55
        };
    }
}