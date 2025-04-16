struct Inner {
    val1: Int;
    val2: Bool?;
}

struct Outer {
    nested: Inner;
    flag: Bool;
    text: String;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            nested: Inner{
                val1: 123,
                val2: true,
            },
            flag: false,
            text: "hi"
        };
    }
}