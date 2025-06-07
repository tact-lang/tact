struct MultiTypeStruct {
    x: Int;
    y: Bool;
    z: String;
    w: Address;
    q: Cell;
    s: Slice;
}

contract MultiTypeContract {
    data: MultiTypeStruct;
    init() {
        self.data = MultiTypeStruct{
            x: 1,
            y: false,
            z: "str",
            w: myAddress(),
            q: emptyCell(),
            s: emptyCell().asSlice()
        };
    }
}