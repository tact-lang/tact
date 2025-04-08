struct BigNest {
    sub1: Int;
    sub2: Bool;
    sub3: String;
    sub4: Cell;
    sub5: Bool?;
    sub6: Int?;
    sub7: String?;
    sub8: Cell?;
}

contract TestContract {
    data: BigNest;

    init() {
        self.data = BigNest{
            sub1: 42,
            sub2: true,
            sub3: "hello",
            sub4: emptyCell(),
            sub5: null,
            sub6: null,
            sub7: null,
            sub8: null
        };
    }
}