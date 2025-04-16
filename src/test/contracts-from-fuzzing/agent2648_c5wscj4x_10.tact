struct Tuple {
    first: Int;
    second: Int;
    third: Int;
}

struct Container {
    a: Tuple;
    b: Tuple;
    c: Int;
    d: Int?;
    e: Bool;
    f: String;
}

contract WideStruct {
    st: Container;

    init() {
        self.st = Container{
            a: Tuple{ first:1, second:2, third:3 },
            b: Tuple{ first:4, second:5, third:6 },
            c: 7,
            d: null,
            e: true,
            f: "hello"
        };
    }
}