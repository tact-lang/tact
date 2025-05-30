struct StructWithRem {
    val: Int;
    rest: Slice as remaining;
}

contract ContractRem {
    data: StructWithRem;

    init() {
        self.data = StructWithRem{
            val: 5,
            rest: emptyCell().asSlice()
        };
    }
}