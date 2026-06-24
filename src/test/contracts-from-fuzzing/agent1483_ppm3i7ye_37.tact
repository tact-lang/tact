struct OptStruct {
    f1: Int? = null;
    f2: Int? = null;
    f3: Int? = null;
    f4: Bool? = null;
    f5: String? = null;
}

struct DeepOpt {
    a: OptStruct? = null;
    b: OptStruct? = null;
    c: OptStruct? = null;
}

contract ManyLayerManyOptionals {
    deep: DeepOpt;

    init() {
        self.deep = DeepOpt{};
    }
}