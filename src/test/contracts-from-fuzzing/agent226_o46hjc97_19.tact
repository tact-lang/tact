struct DeepWithOptionalSlice {
    x: Level;
}

struct Level {
    y: Level2;
}

struct Level2 {
    c: Cell?;
    s: Slice?;
}

contract TestDeepOptCellsSlices {
    state: DeepWithOptionalSlice;

    init() {
        self.state = DeepWithOptionalSlice {
            x: Level {
                y: Level2 { c: null, s: null }
            }
        };
    }
}
