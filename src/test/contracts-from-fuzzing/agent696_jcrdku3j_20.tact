struct SliceDemo {
    s: Slice;
    c: Cell;
    str: String;
}

contract TestContract {
    data: SliceDemo;

    init() {
        self.data = SliceDemo{
            s: emptyCell().asSlice(),
            c: emptyCell(),
            str: "hi"
        };
    }
}