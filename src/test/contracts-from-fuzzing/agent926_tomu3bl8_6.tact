struct Composite {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
}

struct Wrapper {
    nested: Composite?;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested: null
        };
    }
}