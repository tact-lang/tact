struct Outer {
    a: Int;
    s1: Inner1;
    s2: Inner2;
}

struct Inner1 {
    b: Bool;
    str: String;
}

struct Inner2 {
    addr: Address;
    num: Int;
}

contract TestContract {
    o: Outer;

    init() {
        self.o = Outer{
            a: 1,
            s1: Inner1{b:false, str:"hi"},
            s2: Inner2{addr:myAddress(), num:2}
        };
    }
}