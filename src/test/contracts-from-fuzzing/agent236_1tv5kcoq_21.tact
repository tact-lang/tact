struct RestTest {
    a: Int;
    b: Cell as remaining;
}

contract LastFieldRemainingStruct {
    data: RestTest;

    init() {
        self.data = RestTest{a:5, b:emptyCell()};
    }
}