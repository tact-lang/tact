struct DeepOptional {
    s: String?;
    i: Int?;
    b: Bool?;
}

struct Wrapper {
    d1: DeepOptional?;
    d2: DeepOptional?;
    d3: DeepOptional?;
}

contract MultiOpt {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            d1: null,
            d2: null,
            d3: DeepOptional{ s:null, i:null, b:null }
        };
    }
}
