struct S { x: Int; y: Int; z: Int }

contract Test {
    point: S;

    init() {
        self.point = S{ x: 1, y: 2, z: 3 };
    }
}