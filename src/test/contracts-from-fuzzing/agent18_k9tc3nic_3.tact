struct Inner {
    innerVal: Int;
    flag: Bool;
}

struct Outer {
    nested: Inner;
    text: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                innerVal: 7,
                flag: true,
            },
            text: "abc",
        };
    }
}