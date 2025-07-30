struct S {
    arr1: Builder;
    arr2: Cell;
    arr3: Slice;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{
            arr1: beginCell(),
            arr2: emptyCell(),
            arr3: emptyCell().asSlice()
        };
    }
}