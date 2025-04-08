struct Data { foo: Int; bar: Bool; }

contract OptStruct {
    val: Data?;

    init() {
        self.val = null;
    }
}