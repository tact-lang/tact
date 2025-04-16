struct RemainDemo {
    x: Int;
    rest: Slice as remaining;
}

contract RemainContract {
    val: RemainDemo;

    init() {
        self.val = RemainDemo{
            x: 5,
            rest: emptyCell().asSlice()
        };
    }
}
