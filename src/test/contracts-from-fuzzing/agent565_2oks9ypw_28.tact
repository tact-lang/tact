// Persistent storage with default-constructed nested struct
struct Inner {
    x: Int = 5;
    y: String = "hello";
}

contract WithNestedDefaults {
    field: Inner;

    init() {
        self.field = Inner{};
    }
}