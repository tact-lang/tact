struct LargeNested {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
}

struct Wrap1 {
    inner: LargeNested;
}

struct Wrap2 {
    wrapped: Wrap1;
}

contract DeepWrap {
    data: Wrap2;

    init() {
        self.data = Wrap2{
            wrapped: Wrap1{
                inner: LargeNested{
                    a:1, b:true, c:2, d:false, e:3, f:true
                }
            }
        };
    }
}