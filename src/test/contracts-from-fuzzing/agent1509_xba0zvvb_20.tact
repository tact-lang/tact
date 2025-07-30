struct NestedMulti {
    inner1: Int;
    inner2: NestedInner;
}

struct NestedInner {
    a: Int;
    b: Bool;
    c: String?;
    d: Address;
    e: Address?;
}

contract NestedMultiContract {
    f: NestedMulti;
    init() {
        self.f = NestedMulti {
            inner1: 111,
            inner2: NestedInner {
                a:1,b:true,c:null,d:myAddress(),e:null
            }
        };
    }
    receive() {
        let _ = self.f.inner2.d;
    }
}