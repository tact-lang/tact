struct InnerRem {
    a: Int;
    b: Cell as remaining;
}

contract RemStructTest {
    data: InnerRem;

    init() {
        self.data = InnerRem{
            a: 7,
            b: emptyCell()
        };
    }
}