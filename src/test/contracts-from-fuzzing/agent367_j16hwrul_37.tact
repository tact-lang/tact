// nested opt struct inside contract field (not param)
struct InnerOptional {
    x: Int?;
    y: Bool?;
}

contract NestedOptionalField {
    data: InnerOptional?;
    init() {
        self.data = null;
    }
}