// deeply nested optionals of structs inside contract field
struct DeepOptional {
    sub: SubOpt?;
}

struct SubOpt {
    val: Int?;
    flag: Bool?;
}

contract DeepOptContract {
    dopt: DeepOptional?;

    init() {
        self.dopt = null;
    }
}