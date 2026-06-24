struct S {
    x: Int;
    y: Int;
    z: Int;
    t: Int;
    e: String;
    f: Bool;
    g: Cell;
    h: Builder;
    i: Slice;
}

contract TestContract {
    data: S;
    init() {
        self.data = S{
            x: 1, y: 2, z: 3, t: 4, e: "e", f: false,
            g: emptyCell(), h: beginCell(), i: emptyCell().asSlice()
        };
    }
}
