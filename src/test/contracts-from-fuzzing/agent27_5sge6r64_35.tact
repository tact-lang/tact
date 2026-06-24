// Use serialization attributes on persistent optional fields
contract TestContract {
    a: Int? as uint16;
    b: Int? as int64;
    init() {
        self.a = null;
        self.b = null;
    }
}
