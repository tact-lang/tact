struct Small {
    a: Int;
    b: Bool;
}

struct MiddleOpt {
    val: Small?;
    num: Int;
}

contract WrapperOptional {
    contain: MiddleOpt;

    init() {
        self.contain = MiddleOpt{
            val: null,
            num: 1
        };
    }
}