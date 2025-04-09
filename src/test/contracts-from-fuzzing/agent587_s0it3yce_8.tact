struct SomeStruct {
    x: Int = 42;
    y: Bool? = null;
}

contract DefaultedStructStorage {
    val: SomeStruct;
    init() {
        self.val = SomeStruct{};
    }
    receive() {
        let _ = self.val.x;
    }
}