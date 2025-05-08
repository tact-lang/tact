struct OptionalDeep {
    x: Int?;
    inside: Inner?;
}

struct Inner {
    y: Bool;
}

contract OptDeepCombine {
    val: OptionalDeep;

    init() {
        self.val = OptionalDeep{
            x: null,
            inside: Inner{
                y: false
            }
        };
    }
}
