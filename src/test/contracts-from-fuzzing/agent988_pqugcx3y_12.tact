struct DeepOpt {
    val: Int?;
    str: String?;
}

struct Holder {
    deep: DeepOpt?;
}

contract NestedOptions {
    h: Holder;

    init() {
        self.h = Holder{
            deep: DeepOpt{
                val: null,
                str: "x"
            }
        };
    }
}