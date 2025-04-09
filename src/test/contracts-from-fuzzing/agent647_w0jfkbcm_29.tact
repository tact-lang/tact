// optional Int with explicit serialization format
contract TestContract {
    a: Int? as uint64;

    init() {
        self.a = 123;
    }
}