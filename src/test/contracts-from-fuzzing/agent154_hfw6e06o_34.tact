struct OuterOpt {
    in1: InnerOpt?;
    in2: InnerOpt;
}

struct InnerOpt {
    a: Int;
    b: Int?;
}

contract OuterOptContract {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            in1: null,
            in2: InnerOpt{ a:5, b:null}
        };
    }
}