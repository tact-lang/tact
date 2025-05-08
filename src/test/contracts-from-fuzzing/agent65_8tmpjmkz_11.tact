struct Inner1 {
    foo: Int;
    bar: Bool;
}

struct Inner2 {
    baz: String;
}

struct Complex {
    x: Int;
    y: Bool;
    z: String;
    optNested: Inner1?;
    nested2: Inner2;
}

contract MegaContract {
    data: Complex;

    init() {
        self.data = Complex{
            x: 5,
            y: true,
            z: "hi",
            optNested: null,
            nested2: Inner2{baz: "inner"}
        };
    }
}