// Nested struct with primitive fields and optional thereof
struct Data {
    x: Int;
    y: Bool;
    s: String;
    addr: Address;
}

contract TestContract {
    maybeData: Data?;

    init() {
        self.maybeData = null;
    }
}