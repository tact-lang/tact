struct DeepNest {
    val: Int;
    next: InnerNest;
}

struct InnerNest {
    flag: Bool;
    info: FinalNest;
}

struct FinalNest {
    data: String;
    opt: Bool?;
}

contract NestContract {
    storage: DeepNest;

    init() {
        self.storage = DeepNest{
            val: 10,
            next: InnerNest{
                flag: true,
                info: FinalNest{
                    data: "hello",
                    opt: null,
                },
            },
        };
    }
}