struct ReorderTest {
    first: Int;
    second: Bool;
    third: String;
    fourth: Int;
    fifth: Bool;
    sixth: String;
}

contract TestReordering {
    v: ReorderTest;

    init() {
        self.v = ReorderTest{
            first: 1,
            second: false,
            third: "x",
            fourth: 2,
            fifth: true,
            sixth: "y"
        };
    }
}
