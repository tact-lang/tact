struct OptionalString {
    text: String?;
}

struct Outer {
    opt: OptionalString?;
    num: Int;
}

contract OptionalInOptional {
    d: Outer;

    init() {
        self.d = Outer{
            opt: null,
            num: 5
        };
    }
}