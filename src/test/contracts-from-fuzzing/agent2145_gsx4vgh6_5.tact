struct Defaults {
    intField: Int = 5;
    boolField: Bool = false;
    strField: String = "default";
}

contract StorageTest {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}