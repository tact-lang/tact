struct Inner {
    value: Int;
    flag: Bool;
}

struct Outer {
    text: String;
    innerOpt: Inner?;
}

contract NestedOptionalStructTest {
    data: Outer = Outer{ text: "hi", innerOpt: null };

    receive() {
        self.data;
    }
}