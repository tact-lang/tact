struct InnerOpt {
    foo: Int?;
}

struct OutOpt {
    bar: InnerOpt?;
}

contract DoubleOptional {
    s: OutOpt;
    init() {
        self.s = OutOpt{ bar: null };
    }
}