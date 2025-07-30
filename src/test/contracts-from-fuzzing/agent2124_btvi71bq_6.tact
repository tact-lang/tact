struct Inner {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
}

struct Wrapper {
    w1: Inner;
    w2: Inner;
    w3: Inner;
    w4: Inner;
}

contract Wrapped {
    x: Wrapper;

    init() {
        let inn: Inner = Inner{ a:1, b:true, c:emptyCell(), d:emptyCell().asSlice() };
        self.x = Wrapper{ w1:inn, w2:inn, w3:inn, w4:inn };
    }
}