struct MixedTypes {
    x: Int;
    y: Bool;
    z: String;
    addr: Address;
    sl: Slice;
    cl: Cell;
    bl: Builder;
}

contract MixedTypesStorageTest {
    val: MixedTypes;

    init() {
        self.val = MixedTypes{
            x: 1,
            y: true,
            z: "Hello",
            addr: myAddress(),
            sl: emptyCell().asSlice(),
            cl: emptyCell(),
            bl: beginCell()
        };
    }
}