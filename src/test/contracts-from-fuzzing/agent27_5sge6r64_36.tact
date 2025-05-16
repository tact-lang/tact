// optional nested struct field with serialization attribute inside persistent storage
struct Nested {
    id: Int as uint32;
    val: Int? as int64;
}

contract TestContract {
    data: Nested?;
    init() {
        self.data = null;
    }
}
