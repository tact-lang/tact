struct S { f1: Int; f2: Bool; f3: String; f4: Address; f5: Int?; }

contract OptionalNestedStructFieldInField {
    data: S?;

    init() {
        self.data = null;
    }
}