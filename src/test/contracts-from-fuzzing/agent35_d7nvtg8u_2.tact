struct A { x: Int; y: Int; z: Int }

contract SingleStructField {
    s: A;

    init() {
        self.s = A{ x: 1, y: 2, z: 3 };
    }
}