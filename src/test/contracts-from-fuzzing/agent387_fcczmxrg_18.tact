struct Wrap {
    cellx: Cell;
}

contract NestedAsmInInit {
    wrap: Wrap;

    init() {
        self.wrap = Wrap{
            cellx: emptyCell()
        };
    }
}