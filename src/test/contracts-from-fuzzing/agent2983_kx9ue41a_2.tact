struct NestedStructLevel2 {
    n: Int;
    flag: Bool;
}

struct NestedStructLevel1 {
    s: NestedStructLevel2;
    text: String;
}

contract NestedStructsTest {
    nested: NestedStructLevel1;

    init() {
        self.nested = NestedStructLevel1{
            s: NestedStructLevel2{ n: 10, flag: true },
            text: "hello"
        };
    }
}