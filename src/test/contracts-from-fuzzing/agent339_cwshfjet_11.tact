struct MixedSerialization {
    int1: Int as int64;
    int2: Int as uint4;
    int3: Int; // default serialization
    addr: Address;
    slice: Slice;
    cell: Cell;
    optInt: Int?;
    optAddr: Address?;
}

contract SerContract {
    data: MixedSerialization;

    init() {
        self.data = MixedSerialization{
            int1: 1,
            int2: 2,
            int3: 3,
            addr: myAddress(),
            slice: emptyCell().asSlice(),
            cell: emptyCell(),
            optInt: null,
            optAddr: null
        };
    }
}