struct Wrapper {
    payload: Cell;
}

struct Outer {
    info: Wrapper;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            info: Wrapper{ payload: emptyCell() },
            flag: true
        };
    }
}