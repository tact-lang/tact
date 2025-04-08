struct OptionalNesting {
    innerOpt: Inner?;
}

struct Inner {
    flag: Bool;
    dataOpt: Data?;
}

struct Data {
    number: Int;
    text: String;
}

contract Test5 {
    s: OptionalNesting;

    init() {
        self.s = OptionalNesting{
            innerOpt: Inner{
                flag: true,
                dataOpt: Data{
                    number: 10,
                    text: "ok"
                }
            }
        };
    }
}