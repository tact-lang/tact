struct InnerOpt {
    str: String;
    optInt: Int?;
}

contract ComplexDefaults {
    innerOpt: InnerOpt = InnerOpt {
        str: "default",
        optInt: null
    };

    init() {
        // default used
    }
}
