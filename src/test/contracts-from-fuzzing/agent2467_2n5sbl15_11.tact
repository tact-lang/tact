struct WithString { s: String; }
struct WithSlice { s: Slice; }
struct WithCell { c: Cell; }

struct MultiNested {
    a: WithString;
    b: WithSlice;
    c: WithCell;
}

contract MultiNestedContract {
    m: MultiNested;
    init() {
        self.m = MultiNested{
            a: WithString{ s: "test" },
            b: WithSlice{ s: emptyCell().asSlice() },
            c: WithCell{ c: emptyCell() }
        };
    }
}