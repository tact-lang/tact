struct Optionals {
    x: Int?;
    y: Int?;
    z: Int?;
}

contract InitNullTest {
    val: Optionals;

    init() {
        self.val = Optionals{};
    }
}
