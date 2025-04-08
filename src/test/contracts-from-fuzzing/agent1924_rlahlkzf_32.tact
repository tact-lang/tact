struct NestedComplex {
    a: Int;
    b: Inner1;
    c: Inner2;
}

struct Inner1 {
    x: Bool;
    y: String;
}

struct Inner2 {
    k: Int;
    m: String?;
}

contract TestContract {
    data: NestedComplex;

    init() {
        self.data = NestedComplex{
            a: 7,
            b: Inner1{ x:true, y:"yo" },
            c: Inner2{ k:42, m:null }
        };
    }
}