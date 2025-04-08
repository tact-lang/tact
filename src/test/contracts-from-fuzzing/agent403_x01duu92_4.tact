struct ManyOptional {
    f1: Int?;
    f2: Bool?;
    f3: Address?;
    f4: Slice?;
    f5: Cell?;
    f6: String?;
}

contract OptionalsTest {
    many: ManyOptional;
    init() {
        self.many = ManyOptional{
            f1: null,
            f2: null,
            f3: null,
            f4: null,
            f5: null,
            f6: null,
        };
    }
}
