struct Point {
    x: Int;
    y: Int;
}

struct OptionalPoint {
    point: Point?;
}

contract Test {
    op: OptionalPoint = OptionalPoint { point: null };

    get fun getOptionalPoint(): OptionalPoint {
        return self.op;
    }

    receive() {
        self.getOptionalPoint();
    }
}
