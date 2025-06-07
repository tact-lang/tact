struct Innermost {
    v1: Int;
    v2: Bool;
}
struct Middle {
    i: Int;
    nested: Innermost;
}
struct Outermost {
    opt: Middle?;
    plain: Innermost;
}

contract DeepOptional {
    data: Outermost;

    init() {
        self.data = Outermost{
            opt: null,
            plain: Innermost{
                v1: 1,
                v2: false
            }
        };
    }
}