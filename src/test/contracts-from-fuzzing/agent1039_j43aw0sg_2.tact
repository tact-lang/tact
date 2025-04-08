struct DeepNested {
    n1: Int;
    n2: Nested;
}

struct Nested {
    val: Int;
    opt: Bool?;
    inner: Inner;
}

struct Inner {
    text: String;
    flag: Bool;
}

contract TestContract {
    dep: DeepNested;

    init() {
        self.dep = DeepNested{
            n1: 1,
            n2: Nested{
                val: 2,
                opt: null,
                inner: Inner{
                    text: "hi",
                    flag: true
                }
            }
        };
    }
}