struct NestedStruct { s: String; opt: Bool?; }

contract OptionalNested {
    data: NestedStruct?;

    init() {
        self.data = null;
    }
}