struct SimpleStruct { a: Int; b: Bool; c: String; }

contract StorageTest {
    val: SimpleStruct;

    init() {
        self.val = SimpleStruct{ a: 1, b: true, c: "test" };
    }
}