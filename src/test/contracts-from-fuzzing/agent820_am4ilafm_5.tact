struct NestedOpt {
    inner: Int?;
    flag: Bool;
}

struct Container {
    nested: NestedOpt;
    sval: String;
}

contract OptionalNestedStruct {
    info: Container;

    init() {
        self.info = Container{
            nested: NestedOpt{inner: null, flag: true},
            sval: "ok"
        };
    }
}