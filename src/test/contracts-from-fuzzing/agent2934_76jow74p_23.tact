struct Inner {
    data: String;
}

struct Outer {
    ptr: Cell;
    payload: Inner;
}

contract CellAndStruct {
    d: Outer;

    init() {
        self.d = Outer{
            ptr: emptyCell(),
            payload: Inner{ data: "abc" },
        };
    }
}