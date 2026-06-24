struct TupleLike {
    first: Int;
    second: Bool;
    third: String;
}

contract TupleStruct {
    data: TupleLike;

    init() {
        self.data = TupleLike {
            first: 1,
            second: true,
            third: "x",
        };
    }

    receive() {}
}
