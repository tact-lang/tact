struct DeepOpt {
    innerOpt: Inner?;
}

struct Inner {
    intVal: Int?;
    boolVal: Bool?;
}

contract FuzzDeepOpt {
    data: DeepOpt;

    init() {
        self.data = DeepOpt {
            innerOpt: Inner {
                intVal: 123,
                boolVal: true,
            }
        };
    }
}
