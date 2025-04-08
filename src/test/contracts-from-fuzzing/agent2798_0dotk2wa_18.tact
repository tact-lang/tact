struct NestedOptionals {
    x: Int?;
    sub: InnerOpt?
}

struct InnerOpt {
    z: Bool?;
    y: DeepOpt?
}

struct DeepOpt {
    v: String?;
}

contract DeepOptionalContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            x:null,
            sub: InnerOpt{
                z:null,
                y: DeepOpt{
                    v:null
                }
            }
        };
    }
}