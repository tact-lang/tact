struct OptionalContract {
    id: Int;
    info: String?;
}

contract OptCont {
    data: OptionalContract?;

    init() {
        self.data = OptionalContract{
            id: 1,
            info: "abc",
        };
    }
}