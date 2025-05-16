struct ManyOptionals {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Cell?;
    f5: Slice?;
    f6: Address?;
}

contract OptionalFields {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            f1: null,
            f2: true,
            f3: "hi",
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: myAddress(),
        };
    }

    receive() {
        let d = self.data;
    }
}