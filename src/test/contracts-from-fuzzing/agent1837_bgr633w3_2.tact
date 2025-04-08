struct WrappedPrimitives {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    stringVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
}

contract WrapperContract {
    wrapped: WrappedPrimitives;

    init() {
        self.wrapped = WrappedPrimitives{
            intVal: 1,
            boolVal: true,
            addressVal: myAddress(),
            stringVal: "hello",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
        };
    }
}