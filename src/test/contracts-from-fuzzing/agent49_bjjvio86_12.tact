struct BigNested {
    a: Int;
    b: Inner1;
    c: Inner2;
}

struct Inner1 {
    val: Int;
    opt: Bool?;
}

struct Inner2 {
    flag: Bool;
    addr: Address;
}

contract ComplexStructField {
    big: BigNested;

    init() {
        self.big = BigNested{
            a: 77,
            b: Inner1{val: 88, opt: false},
            c: Inner2{flag: true, addr: myAddress()},
        };
    }
}
