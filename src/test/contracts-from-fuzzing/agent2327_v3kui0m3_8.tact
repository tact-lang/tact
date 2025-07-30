struct DeepNestOpt {
    s1: Int;
    s2: String;
    inner: Inner?;
}

struct Inner {
    flag: Bool;
    addr: Address;
    deeper: Deeper?;
}

struct Deeper {
    val: Int;
    message: String;
}

contract TestDeepNestOpt {
    storage: DeepNestOpt;

    init() {
        self.storage = DeepNestOpt{
            s1: 1,
            s2: "hello",
            inner: Inner{
                flag: true,
                addr: myAddress(),
                deeper: Deeper{
                    val: 777,
                    message: "bye"
                }
            }
        };
    }
}
