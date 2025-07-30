struct PrimitiveMix {
    field1: Int;
    field2: Bool;
    field3: Address;
    field4: String;
    field5: Cell;
    field6: Slice;
    field7: Builder;
}

contract PrimitiveMixTest {
    mix: PrimitiveMix;

    init() {
        self.mix = PrimitiveMix{
            field1: 1,
            field2: true,
            field3: myAddress(),
            field4: "test",
            field5: emptyCell(),
            field6: emptyCell().asSlice(),
            field7: beginCell()
        };
    }
}
