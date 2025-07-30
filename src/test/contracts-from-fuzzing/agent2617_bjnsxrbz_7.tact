struct Deep {
    deepVal: Int?;
    label: String;
}

struct Mid {
    a: Int;
    inner: Deep?;
}

struct OuterOptional {
    middle: Mid?;
    tag: String;
}

contract DeepOptionals {
    data: OuterOptional;
    init() {
        self.data = OuterOptional{
            middle: null,
            tag: "tag"
        };
    }
}