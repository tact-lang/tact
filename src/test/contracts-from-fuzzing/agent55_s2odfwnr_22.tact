struct DeepOptional {
    i: Int = 0;
    nested: Bool?;
}

struct OuterOpt {
    opt: DeepOptional?;
}

contract OptionalStructInOptional {
    o: OuterOpt;

    init() {
        self.o = OuterOpt{
            opt: null
        };
    }
}
