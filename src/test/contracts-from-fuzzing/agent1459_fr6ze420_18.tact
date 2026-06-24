// Test optional struct containing optional string
struct Data {
    val: String?;
}

contract OptStructOptField {
    d: Data?;

    init() {
        self.d = null;
    }
}