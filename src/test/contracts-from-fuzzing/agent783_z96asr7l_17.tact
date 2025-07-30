struct Counts {
    x: Int;
    y: Int;
}

contract OverwriteDefaultSub {
    field: Counts = Counts { x: 17, y: 34 };

    init() {
        self.field = Counts { x: 42, y: 100 };
    }
}