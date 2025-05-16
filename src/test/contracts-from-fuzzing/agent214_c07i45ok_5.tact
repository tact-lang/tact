struct OptionalWrapped {
    val: Int?;
    txt: String?;
}

contract TestContract {
    o: OptionalWrapped;

    init() {
        self.o = OptionalWrapped{
            val: null,
            txt: null,
        };
    }
}
