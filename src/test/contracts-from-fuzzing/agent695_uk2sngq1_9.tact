struct Base {
    id: Int;
    label: String;
}

struct HasOptBase {
    maybe: Base?;
    note: String;
}

contract OptionalStructField {
    val: HasOptBase;

    init() {
        self.val = HasOptBase{
            maybe: null,
            note: "abc",
        };
    }
}