struct DeepWithOptionals {
    a: Int?;
    b: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract DeepOptContract {
    info: DeepWithOptionals;

    init() {
        self.info = DeepWithOptionals{
            a: null,
            b: InnerOpt{
                x: 7,
                y: null,
            },
        };
    }
}
