struct NestedComplicated {
    nested: DeepComp;
}

struct DeepComp {
    optStr: String?;
    optBool: Bool?;
    optInt: Int?;
    inner: DeeperComp;
}

struct DeeperComp {
    s: String;
    intVal: Int;
    boolVal: Bool;
}

contract DeeplyNestedOptions {
    storage: NestedComplicated;

    init() {
        self.storage = NestedComplicated{
            nested: DeepComp{
                optStr: null,
                optBool: null,
                optInt: null,
                inner: DeeperComp{
                    s: "ok",
                    intVal: 123,
                    boolVal: true,
                },
            },
        };
    }
}