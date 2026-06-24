struct L1 {
    a: Bool;
    b: L2;
}

struct L2 {
    c: Bool;
    d: L3;
}

struct L3 {
    e: Bool;
}

contract ManyBoolsNested {
    data: L1;
    init() {
        self.data = L1{
            a:true,
            b:L2{
                c:false,
                d:L3{e:true}
            }
        };
    }
}