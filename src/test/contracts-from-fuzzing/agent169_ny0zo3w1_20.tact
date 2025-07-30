struct HasRemaining {
    prefix: Int as uint8;
    suffix: Cell as remaining;
}

contract TestContract {
    hr: HasRemaining;

    init() {
        self.hr = HasRemaining{ prefix: 255, suffix: emptyCell() };
    }
}