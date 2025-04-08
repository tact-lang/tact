struct InnerBool1 {
    a: Bool;
    b: Bool;
    c: Bool;
}

struct InnerBool2 {
    d: Bool;
    e: Bool;
    f: Bool;
}

struct Outer {
    first: InnerBool1;
    second: InnerBool2;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            first: InnerBool1{
                a:true, b:false, c:true
            },
            second: InnerBool2{
                d:false, e:true, f:false
            }
        };
    }
}
