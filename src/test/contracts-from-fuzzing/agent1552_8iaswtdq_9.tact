struct X {
    s: String;
    i: Int;
    b: Bool;
}

struct Y {
    x: X;
    opt1: Int?;
    opt2: Bool?;
    str: String;
}

struct Z {
    y: Y;
    x: X;
    b: Bool;
}

contract ComplexStorage {
    rec: Z;

    init() {
        self.rec = Z{
            y: Y{
                x: X{s: "s", i: 1, b:true},
                opt1: null,
                opt2: false,
                str: "str",
            },
            x: X{s:"s2", i: 2, b:false},
            b: true,
        };
    }
}