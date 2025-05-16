struct ManyOptionals {
    f1: Int?;
    f2: String?;
    f3: Bool?;
    f4: Address?;
    f5: Cell?;
}

contract AllOptionals {
    data: ManyOptionals;
    init() {
        self.data = ManyOptionals {
            f1: null,
            f2: null,
            f3: null,
            f4: null,
            f5: null
        };
    }
}
