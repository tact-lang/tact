struct Complex {
    s1: Inner1;
    s2: Inner2;
    flag: Bool;
    number: Int;
}

struct Inner1 {
    val: Int;
    text: String?;
}

struct Inner2 {
    foo: Int?;
    bar: String;
}

contract TestComplex {
    data: Complex;

    init() {
        self.data = Complex{
            s1: Inner1{val: 1, text: null},
            s2: Inner2{foo: 2, bar: "b"},
            flag: true,
            number: 42,
        };
    }
}