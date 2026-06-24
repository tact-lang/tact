struct Deep {
    val: Int;
}

struct Mid {
    inner: Deep;
}

struct OuterOptional {
    mid: Mid?;
}

contract OptionalMidStruct {
    field: OuterOptional;

    init() {
        self.field = OuterOptional{mid: null};
    }
}