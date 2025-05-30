struct OptS {
    val: Int?;
    txt: String?;
}

contract OptionalAtTopLevel {
    field: OptS?;

    init() {
        self.field = OptS{
            val: null,
            txt: "hi",
        };
    }
}