struct SmallStruct {
    flag: Bool;
}

struct Container {
    a: SmallStruct;
    b: SmallStruct;
    c: SmallStruct;
}

contract RepeatedStructPersistent {
    storage: Container;

    init() {
        self.storage = Container{
            a: SmallStruct{ flag: false },
            b: SmallStruct{ flag: true },
            c: SmallStruct{ flag: false }
        };
    }
}