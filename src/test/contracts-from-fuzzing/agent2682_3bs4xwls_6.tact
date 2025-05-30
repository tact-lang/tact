struct DeeplyOptional {
    item: Inner?;
}

struct Inner {
    nested: Deeper?;
}

struct Deeper {
    value: Int?;
    label: String?;
}

contract TestContract {
    s: DeeplyOptional;

    init() {
        self.s = DeeplyOptional{
            item: Inner{
                nested: Deeper{
                    value: 255,
                    label: "hi"
                }
            }
        };
    }
}
