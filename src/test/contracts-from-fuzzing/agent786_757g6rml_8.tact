struct RecDefault {
    a: Int = 5;
    b: Bool = true;
    c: String = "abc";
    d: Slice;
    e: Address;
}

contract DefaultsPersisted {
    rec: RecDefault;

    init() {
        self.rec = RecDefault{
            d: emptyCell().asSlice(),
            e: myAddress()
        };
    }
}