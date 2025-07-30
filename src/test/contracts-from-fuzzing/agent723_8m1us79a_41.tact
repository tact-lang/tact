struct Carrier {
    x: Int;
    data: Slice as remaining;
}

contract TestContract {
    c: Carrier?;

    init() {
        self.c = Carrier{
            x:42,
            data: emptyCell().asSlice(),
        };
    }

    receive() {}
}