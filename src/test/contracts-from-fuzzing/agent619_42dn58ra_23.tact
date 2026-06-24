struct SOpt {
    a: Int?;
    b: Bool?;
}

struct SNestedOpt {
    x: SOpt?;
}

contract OptionalInOptional {
    data: SNestedOpt;

    init() {
        self.data = SNestedOpt{ x: null };
    }
}