struct NullablePrimitives {
    addr: Address?;
    sl: Slice?;
    cel: Cell?;
}

contract NullablePrimitivesContract {
    data: NullablePrimitives;
    init() {
        self.data = NullablePrimitives{addr:null, sl:null, cel:null};
    }
}