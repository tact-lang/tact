struct S1 {
    field1: Int;
    field2: Bool;
    field3: Address;
    field4: Cell;
    field5: Slice;
    field6: String;
}

contract TestContract {
    s: S1;

    init() {
        self.s = S1{
            field1: 1,
            field2: true,
            field3: myAddress(),
            field4: emptyCell(),
            field5: emptyCell().asSlice(),
            field6: "abc"
        };
    }
}
