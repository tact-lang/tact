struct ManyOptionals {
    f1: Int?;
    f2: Bool?;
    f3: Address?;
    f4: Cell?;
    f5: Slice?;
    f6: String?;
}

contract OptionalsInState {
    m: ManyOptionals;

    init() {
        self.m = ManyOptionals{
            f1: null,
            f2: true,
            f3: null,
            f4: null,
            f5: null,
            f6: "str",
        };
    }

    receive() {}
}