struct BothNestedOpt {
    inner1: Int?;
    inner2: Bool?;
}

struct Cont {
    container: BothNestedOpt?;
}

contract OptionalContainerStruct {
    storage: Cont;

    init() {
        self.storage = Cont{
            container: BothNestedOpt{
                inner1: 1,
                inner2: true
            }
        };
    }
}