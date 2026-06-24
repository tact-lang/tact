struct Mix {
    flag: Bool;
    count: Int as uint16;
    payload: Slice as remaining;
}

contract Test25 {
    data: Mix;

    init() {
        self.data = Mix{
            flag: true,
            count: 99,
            payload: emptyCell().asSlice(),
        };
    }
}