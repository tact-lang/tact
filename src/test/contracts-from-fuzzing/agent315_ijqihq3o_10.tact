struct One {
    v1: Int;
    v2: Bool?;
}

struct Two {
    s: One?;
    b: Bool;
}

contract OptionalInOptional {
    val: Two;

    init() {
        self.val = Two{
            s: null,
            b: true,
        };
    }
}