struct OneOpt {
    val: Int?;
}

struct Another {
    main: OneOpt;
    extra: Int;
}

contract OptionInsideStruct {
    s: Another;

    init() {
        self.s = Another{
            main: OneOpt{val:null},
            extra:7
        };
    }
}