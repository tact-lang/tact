struct A {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract AllOptionals {
    val: A;

    init() {
        self.val = A{ x: null, y: true, z: null };
    }
}