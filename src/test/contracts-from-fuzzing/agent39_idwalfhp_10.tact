struct OptionalDeep {
    val: Int?;
    label: String;
}

struct Wrap {
    content: OptionalDeep?;
    flag: Bool;
}

contract OptionalNested {
    container: Wrap;

    init() {
        self.container = Wrap{
            content: OptionalDeep{
                val: null,
                label: "ok",
            },
            flag: true,
        };
    }
}