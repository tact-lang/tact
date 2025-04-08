struct OnlyOptionals {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalsOnly {
    st: OnlyOptionals;

    init() {
        self.st = OnlyOptionals{
            i: null,
            b: null,
            s: null
        };
    }
}