struct ManyOptionals {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Int?;
    f5: Int?;
    f6: Bool?;
    f7: Bool?;
    f8: Address?;
    f9: Cell?;
    f10: Slice?;
}

contract TestContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            f1: null,
            f2: null,
            f3: null,
            f4: null,
            f5: null,
            f6: null,
            f7: null,
            f8: null,
            f9: null,
            f10: null,
        };
    }
}