struct ManyNestedOptionals {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Slice?;
    f5: Cell?;
    f6: Address?;
}

contract TestOpt {
    data: ManyNestedOptionals?;

    init() {
        self.data = ManyNestedOptionals{
            f1: 1,
            f2: false,
            f3: null,
            f4: null,
            f5: null,
            f6: null,
        };
    }
}