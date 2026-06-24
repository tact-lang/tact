struct NestedA {
    v1: Int;
    v2: Bool;
}

struct NestedB {
    x: String;
    y: Cell;
}

struct Container {
    first: NestedA;
    second: NestedB;
}

contract NestedRecordContract {
    rec: Container;

    init() {
        self.rec = Container{
            first: NestedA{ v1: 5, v2: true },
            second: NestedB{ x:"hi", y: emptyCell()}
        };
    }
}