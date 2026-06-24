struct Inner {
    s: String;
    flag: Bool;
}

struct Outer {
    val1: Int;
    val2: Int?;
    nested: Inner;
}

contract MixedTypes {
    data: Outer;

    init() {
        self.data = Outer{
            val1: 1,
            val2: null,
            nested: Inner{
                s: "hi",
                flag: true
            }
        };
    }
}
