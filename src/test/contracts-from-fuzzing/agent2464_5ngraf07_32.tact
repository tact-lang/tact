struct DeepVariant {
    inner: Middle;
}

struct Middle {
    nested: Innermost;
    flag: Bool;
}

struct Innermost {
    val: Int;
    note: String;
}

contract DeepStructs {
    s: DeepVariant;
    init() {
        self.s = DeepVariant{
            inner: Middle{
                nested: Innermost{
                    val: 42,
                    note: "deep"
                },
                flag: true
            }
        };
    }
}
