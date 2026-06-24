// optional struct nested as optional primitive fields
struct S {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract OptionalNestedStruct {
    data: S?;
    init() {
        self.data = null;
    }
}