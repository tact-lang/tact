contract StructVariant {
    data: Variant;

    init() {
        self.data = Variant{
            x: 1,
            y: "hi",
            flag: null
        };
    }
}

struct Variant {
    x: Int;
    y: String;
    flag: Bool?;
}