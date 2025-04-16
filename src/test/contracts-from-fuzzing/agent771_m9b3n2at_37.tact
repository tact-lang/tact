struct OptDeep {
    deeper: Deeper?;
}

struct Deeper {
    val: Int;
    str: String;
}

contract OptionalDeepField {
    field: OptDeep;

    init() {
        self.field = OptDeep{
            deeper: null,
        };
    }
}