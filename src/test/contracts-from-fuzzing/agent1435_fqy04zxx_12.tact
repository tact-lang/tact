struct MultiType {
    n: Int; 
    active: Bool;
    who: Address;
    data: Cell;
    slice: Slice;
    note: String;
}

contract MultiHolder {
    storage: MultiType;

    init() {
        self.storage = MultiType{
            n: 1,
            active: true,
            who: myAddress(),
            data: emptyCell(),
            slice: emptyCell().asSlice(),
            note: "hi"
        };
    }
}