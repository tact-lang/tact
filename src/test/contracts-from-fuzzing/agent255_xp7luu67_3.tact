struct ManyOptionals {
    f1: Int?;
    f2: Bool?;
    f3: Address?;
    f4: String?;
    f5: Cell?;
    f6: Slice?;
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
        };
    }
}