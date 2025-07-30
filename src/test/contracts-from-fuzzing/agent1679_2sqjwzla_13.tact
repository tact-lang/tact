struct TestStruct {
    a: Int;
    b: String = "default";
    c: Bool?;
    d: Cell;
}

contract PartialInit {
    data: TestStruct;

    init() {
        self.data = TestStruct{
            a: 7,
            d: emptyCell()
        };
    }
}