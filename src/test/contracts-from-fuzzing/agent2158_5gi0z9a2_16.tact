struct LargeNested {
    num1: Int;
    num2: Int;
    num3: Int;
    num4: Int;
    num5: Int;
    num6: Int;
    str1: String;
    str2: String;
}

struct Container {
    nested: LargeNested;
    flag: Bool;
    text: String;
    status: Int;
}

contract LargeNestedTest {
    data: Container;

    init() {
        self.data = Container{
            nested: LargeNested{
                num1: 1, num2: 2, num3: 3, num4: 4, num5: 5, num6: 6,
                str1: "a", str2: "b"
            },
            flag: true,
            text: "root",
            status: 42
        };
    }
}