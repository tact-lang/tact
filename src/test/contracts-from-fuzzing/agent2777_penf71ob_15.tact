struct HasRemainder {
    prefix: Int as uint8;
    suffix: Cell as remaining;
}

contract TestContract {
    info: HasRemainder;

    init() {
        self.info = HasRemainder{
            prefix: 42,
            suffix: emptyCell()
        };
    }
}