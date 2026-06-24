struct InnerTest {
    num: Int;
    flag: Bool;
    name: String?;
}

contract StructAsState {
    val: InnerTest;

    init() {
        self.val = InnerTest{
            num: 42,
            flag: true,
            name: null,
        };
    }
}