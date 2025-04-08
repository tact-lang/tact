struct SwithRem {
    prefix: Int as uint32;
    data: Slice as remaining;
}

contract TestContract {
    x: SwithRem;

    init() {
        self.x = SwithRem{
            prefix: 123,
            data: emptyCell().asSlice()
        };
    }
}
