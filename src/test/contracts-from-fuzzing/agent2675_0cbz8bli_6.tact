struct DiverseTypes {
    ab: Bool;
    num: Int;
    txt: String;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
}

struct Wrapper {
    inner: DiverseTypes;
}

contract TestContract {
    data: Wrapper;
    init() {
        self.data = Wrapper{
            inner: DiverseTypes{
                ab: true,
                num: 77,
                txt: "ok",
                addr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
                cellVal: emptyCell(),
                sliceVal: emptyCell().asSlice(),
            }
        };
    }
}