struct OuterS {
    a: Int;
    b: Bool?;
}

struct MiddleS {
    x: Bool;
    inner: OuterS?;
}

contract DeepOptNested {
    rec: MiddleS;

    init() {
        self.rec = MiddleS{
            x:true,
            inner: null
        };
    }
}
