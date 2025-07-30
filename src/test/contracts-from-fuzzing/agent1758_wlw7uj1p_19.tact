struct OptSerialized {
    a: Int? as int64;
    b: Bool?;
    c: String?;
}

contract StorageTest {
    val: OptSerialized;

    init() {
        self.val = OptSerialized{
            a: null,
            b: null,
            c: null
        };
    }
}