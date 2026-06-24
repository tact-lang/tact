// optional of struct with nested optionals
struct InnerLayer {
    a: Int?;
    b: Bool?;
}

contract OptionStructNested {
    field: InnerLayer?;

    init() {
        self.field = null;
    }
}