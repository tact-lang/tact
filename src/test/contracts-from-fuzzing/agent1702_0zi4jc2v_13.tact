struct Inner {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

struct Outer {
    x: Inner;
    y: Inner;
    z: Inner;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            x: Inner{a:null,b:null,c:null,d:null,e:null,f:null},
            y: Inner{a:null,b:null,c:null,d:null,e:null,f:null},
            z: Inner{a:null,b:null,c:null,d:null,e:null,f:null},
        };
    }
}