struct InnerS {
    a: Int;
    b: Bool;
}

struct OuterS {
    s1: InnerS?;
    s2: InnerS?;
    s3: InnerS?;
}

contract TestContract {
    complexOpt: OuterS;

    init() {
        self.complexOpt = OuterS{
            s1: null,
            s2: InnerS{a:5, b:true},
            s3: null
        };
    }
}