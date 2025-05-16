struct DeepNest {
    inner: Inner;
}

struct Inner {
    core: Core;
}

struct Core {
    val: Int;
    txt: String;
    flag: Bool;
}

contract TestStorage {
    storage: DeepNest;

    init() {
        self.storage = DeepNest{
            inner: Inner{
                core: Core{
                    val: 42,
                    txt: "hello",
                    flag: true,
                }
            }
        };
    }
}
