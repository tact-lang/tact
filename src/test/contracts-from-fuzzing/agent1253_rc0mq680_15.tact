struct SerializeTest {
    a: Int as int64;
    b: Int as uint4;
    c: Bool;
}

contract SerializeContract {
    val: SerializeTest;

    init() {
        self.val = SerializeTest{a:42, b:8, c:true};
    }
}
