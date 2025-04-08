struct BigNested {
    s1: Inner1;
    s2: Inner2;
}

struct Inner1 {
    n: Int;
    sub: Inner1Sub;
}

struct Inner1Sub {
    flag: Bool;
    val: String;
}

struct Inner2 {
    address: Address;
    optInner: Inner2Sub?;
}

struct Inner2Sub {
    s: String;
    c: Cell;
}

contract ComplexNested {
    field: BigNested;

    init() {
        self.field = BigNested{
            s1: Inner1{
                n: 100,
                sub: Inner1Sub{ flag: true, val: "hi" }
            },
            s2: Inner2{
                address: myAddress(),
                optInner: null
            }
        };
    }
}