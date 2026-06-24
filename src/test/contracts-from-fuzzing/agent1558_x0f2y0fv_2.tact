struct DeepNested {
    flag: Bool;
    child: Inner;
}

struct Inner {
    num: Int;
    opt: Outer?;
}

struct Outer {
    text: String;
    boolean: Bool?;
}

contract DeepContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            flag: true,
            child: Inner{
                num: 777,
                opt: Outer{
                    text: "hello",
                    boolean: false
                }
            }
        };
    }
}