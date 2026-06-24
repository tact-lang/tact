struct HasSlice {
    sl: Slice;
}

struct HasBuilder {
    b: Builder;
}

struct HasCell {
    c: Cell;
}

struct Composite {
    part1: HasSlice;
    part2: HasBuilder;
    part3: HasCell;
}

contract NestedPrimitives {
    data: Composite;

    init() {
        self.data = Composite{
            part1: HasSlice{sl: emptyCell().asSlice()},
            part2: HasBuilder{b: beginCell()},
            part3: HasCell{c: emptyCell()}
        };
    }
}
