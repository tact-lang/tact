struct OptionalNest {
    innerOpt: StructOpt?;
}

struct StructOpt {
    val1: Int?;
    val2: Bool?;
}

contract OptNested {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            innerOpt: StructOpt{
                val1: null,
                val2: null,
            }
        };
    }
}