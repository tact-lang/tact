struct Inner {
    xi: Int;
    yi: Int?;
    zi: Bool;
}

contract Test {
    point: Inner;

    init() {
        self.point = Inner{
            xi: 5,
            yi: null,
            zi: true,
        };
    }

    receive() {
        let _ = self.point.xi;
    }
}