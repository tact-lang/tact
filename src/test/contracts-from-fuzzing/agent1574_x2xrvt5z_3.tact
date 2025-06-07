struct Deep {
    val: Int;
    inner: Inner;
}

struct Inner {
    flag: Bool;
    core: Core;
}

struct Core {
    text: String;
}

contract DeeplyNested {
    root: Deep;

    init() {
        self.root = Deep{
            val: 42,
            inner: Inner{
                flag: true,
                core: Core{
                    text: "hello"
                }
            }
        };
    }
}