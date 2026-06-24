struct S1 {
    a: Int = 1;
    b: Bool = false;
    c: String = "";
}

struct S2 {
    s: S1;
    d: Int? = null;
}

struct S3 {
    e: S2;
    f: Bool;
}

contract TestContract {
    field: S3;

    init() {
        self.field = S3{
            e: S2{
                s: S1{ a: 10, b: true, c: "hi" },
                d: 20
            },
            f: true
        };
    }
    receive() {
        self.field = S3{
            e: S2{
                s: S1{ a: 11, b: false, c: "ho" },
                d: null
            },
            f: false
        };
    }
}