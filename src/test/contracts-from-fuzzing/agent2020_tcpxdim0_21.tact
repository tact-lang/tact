struct SOpt {
    val: Int?;
}

contract StructWithOptional {
    s: SOpt;

    init() {
        self.s = SOpt{
            val: null,
        };
    }
}
