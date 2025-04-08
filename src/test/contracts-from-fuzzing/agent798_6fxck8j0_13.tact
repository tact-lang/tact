struct SDefault {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
    d: Address? = null;
}

contract InitDefaultStruct {
    val: SDefault;

    init() {
        self.val = SDefault{};
    }
}