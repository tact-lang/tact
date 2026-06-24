struct NestedStruct { x: Int; inner: SimpleStruct }

struct SimpleStruct { a: Int; b: Bool; c: String }

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            x: 42,
            inner: SimpleStruct{ a: 1, b: false, c: "ok" }
        };
    }
}