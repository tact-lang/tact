struct Inner {
    val1: Int;
    val2: Bool;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract TestStorage {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                val1: 123,
                val2: true,
            },
            flag: false,
        };
    }
}