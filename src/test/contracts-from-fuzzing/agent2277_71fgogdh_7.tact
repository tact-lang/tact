struct ManyOptionals {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Address?;
    f5: Int?;
    f6: Bool?;
    f7: String?;
    f8: Address?;
}

contract OptionalMulti {
    big: ManyOptionals;

    init() {
        self.big = ManyOptionals{
            f1: null, f2: null, f3: null, f4: null,
            f5: null, f6: null, f7: null, f8: null
        };
    }
}
