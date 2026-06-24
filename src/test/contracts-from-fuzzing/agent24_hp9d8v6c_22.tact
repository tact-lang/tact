struct EmptyTail {
    x: Int;
    y: Int;
}

contract DefaultAndAssign {
    s: EmptyTail;

    init() {
        self.s = EmptyTail{
            x:1,
            y:2,
        };
    }
}