struct OptOptOpt {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract OptOptOptContract {
    o: OptOptOpt;

    init() {
        self.o = OptOptOpt{
            a: null,
            b: null,
            c: null
        };
    }
}