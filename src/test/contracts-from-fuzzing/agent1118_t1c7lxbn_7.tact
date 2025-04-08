struct StringCellPair {
    s: String;
    c: Cell;
}

struct Container {
    pair: StringCellPair;
    optPair: StringCellPair?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            pair: StringCellPair{s: "abc", c: emptyCell()},
            optPair: null
        };
    }
}