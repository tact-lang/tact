struct A {
    foo: Int;
}

struct B {
    bar: String;
}

struct Container {
    a: A?;
    b: B?;
}

contract ManyOptionalStructs {
    payload: Container;

    init() {
        self.payload = Container{
            a: null,
            b: null,
        };
    }
}
