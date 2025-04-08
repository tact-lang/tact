struct DeepOptional {
    nest: OptionalInner?;
}

struct OptionalInner {
    flag: Bool;
    text: String;
}

contract OptionalNestedStruct {
    info: DeepOptional;

    init() {
        self.info = DeepOptional{ nest: null };
    }
}