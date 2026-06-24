struct OptionalDeep {
    child: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
    str: String?;
}

contract OptionalInsideOptional {
    val: OptionalDeep;

    init() {
        self.val = OptionalDeep{
            child: null
        };
    }
}