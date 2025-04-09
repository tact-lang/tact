struct ComplexNest {
    a: Int;
    b: Inner1;
    c: Inner2;
}

struct Inner1 {
    flag: Bool;
    msg: String;
}

struct Inner2 {
    nested: Inner3;
    number: Int;
}

struct Inner3 {
    data: String;
    optional: Int?;
}

contract TestStorage {
    val: ComplexNest;

    init() {
        self.val = ComplexNest{
            a: 1,
            b: Inner1{
                flag: true,
                msg: "hey"
            },
            c: Inner2{
                nested: Inner3{
                    data: "data",
                    optional: 42
                },
                number: 100
            }
        };
    }
}