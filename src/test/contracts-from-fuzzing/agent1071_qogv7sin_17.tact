struct Base1 {
    a: Int;
    b: Bool;
}

struct Base2 {
    c: String;
    d: Int?;
}

struct Combined {
    first: Base1;
    second: Base2;
    flag: Bool;
}

contract NestedMultiple {
    data: Combined;

    init() {
        self.data = Combined{
            first: Base1{
                a: 1,
                b: false,
            },
            second: Base2{
                c: "hi",
                d: null,
            },
            flag: true,
        };
    }
}