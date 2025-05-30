struct ManyOptionals {
    f1: Bool?;
    f2: Int?;
    f3: Int?;
    f4: Bool?;
    f5: Int?;
}

contract LotsOfOptionals {
    s: ManyOptionals;

    init() {
        self.s = ManyOptionals{
            f1: null,
            f2: null,
            f3: 10,
            f4: false,
            f5: 20
        };
    }
}