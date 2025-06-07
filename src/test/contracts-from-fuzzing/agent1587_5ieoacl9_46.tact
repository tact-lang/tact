struct Deeply {
    inner: InnerOpt?;
}

struct InnerOpt {
    sub: SubOpt?;
}

struct SubOpt {
    value: Int;
}

contract DeepOptNull {
    d: Deeply;

    init() {
        self.d = Deeply{inner:null};
    }
}