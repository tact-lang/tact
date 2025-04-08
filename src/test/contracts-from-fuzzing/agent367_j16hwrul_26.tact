struct DeepCombine {
    a: Int;
    b: InnerC;
    c: InnerC?;
    d: Int?;
    e: Bool;
    f: Bool?;
}

struct InnerC {
    p: Int;
    q: Bool?;
    r: String;
}

contract DeepCombineTest {
    data: DeepCombine;
    init() {
        self.data = DeepCombine{
            a:1,
            b:InnerC{p:2,q:null,r:"r"},
            c:null,
            d:null,
            e:true,
            f:null
        };
    }
}