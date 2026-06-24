struct SingleBool {
    flag: Bool;
}

contract BooleanStructTest {
    val: SingleBool;

    init() {
        self.val = SingleBool{flag: true};
    }
}