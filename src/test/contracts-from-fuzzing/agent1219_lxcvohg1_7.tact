struct DeepNested {
    innerOpt: Inner?;
}

struct Inner {
    val: Int;
    next: Inner2;
}

struct Inner2 {
    enabled: Bool;
    text: String;
    maybeNum: Int?;
}

contract Nesty {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            innerOpt: Inner{
                val: 42,
                next: Inner2{
                    enabled: true,
                    text: "ok",
                    maybeNum: null
                }
            }
        };
    }
}