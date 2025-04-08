struct Sub {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
}

struct Outer {
    sub1: Sub;
    sub2: Sub?;
}

contract TestContract {
    param: Outer;

    init() {
        self.param = Outer{
            sub1: Sub{ a:1, b:true, c:"a", d:address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"), e:null },
            sub2: null
        };
    }
}