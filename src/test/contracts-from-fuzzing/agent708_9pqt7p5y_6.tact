struct ManyOptionals {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Bool?;
    f5: String?;
    f6: Address?;
    f7: Slice?;
    f8: Cell?;
}

contract LotsOfNulls {
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
            f8: null
        };
    }
}
