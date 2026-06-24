struct TupleLike {
    a: Int;
    b: Int;
    c: Int;
}

contract TestAssignPartial {
    data: TupleLike;

    init() {
        self.data = TupleLike{
            a: 10,
            b: 20,
            c: 30
        };
    }
}