struct NestedStrings {
    t1: String;
    t2: String;
    t3: String?;
    t4: String?;
}

contract NestedStringTest {
    val: NestedStrings;
    init() {
        self.val = NestedStrings{
            t1: "hello",
            t2: "test",
            t3: null,
            t4: "bye",
        };
    }
}