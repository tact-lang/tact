struct Inner {
    num: Int;
    text: String;
}

struct Outer {
    flag: Bool;
    nested: Inner;
}

contract NestedStorage {
    data: Outer;

    init() {
        self.data = Outer{
            flag: true,
            nested: Inner{
                num: 42,
                text: "hello"
            }
        };
    }
}