struct MultiNest {
    a: Inner1;
    b: Inner2;
}

struct Inner1 {
    val1: Int;
    val2: Bool;
}

struct Inner2 {
    in3: Inner3;
    strval: String;
}

struct Inner3 {
    flag: Bool;
    opt: String?;
}

contract MultiNestTest {
    d: MultiNest;

    init() {
        self.d = MultiNest{
            a: Inner1{ val1: 1, val2: false },
            b: Inner2{ 
                in3: Inner3{ flag: true, opt: null },
                strval: "ok"
            }
        };
    }
}
