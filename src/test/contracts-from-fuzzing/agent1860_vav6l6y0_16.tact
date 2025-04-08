struct DeeplyOptional {
    x: Int?;
    s: String?;
    nestedOpt: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract ManyOptionals {
    storage: DeeplyOptional = DeeplyOptional{
        x: null,
        s: null,
        nestedOpt: null
    };
}