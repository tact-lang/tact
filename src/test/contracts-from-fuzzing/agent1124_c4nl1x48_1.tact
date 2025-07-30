struct InnerStruct { a: Int; b: Bool; c: String; }

contract NestedStructStorage {
    s: InnerStruct;

    init() {
        self.s = InnerStruct{ a: 1, b: true, c: "hello" };
    }
}