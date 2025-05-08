struct ManyOptionals {
    f1: Int?;
    f2: Bool?;
    f3: Address?;
    f4: Cell?;
    f5: Slice?;
    f6: String?;
    f7: Builder?;
}

contract TestContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            f1: null,
            f2: true,
            f3: null,
            f4: null,
            f5: null,
            f6: "hello",
            f7: null,
        };
    }
}