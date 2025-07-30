struct RemainStruct {
    a: Int;
    rest: Slice as remaining;
}

contract WithRemaining {
    data: RemainStruct;

    init() {
        self.data = RemainStruct{
            a: 1,
            rest: emptyCell().asSlice()
        };
    }
}