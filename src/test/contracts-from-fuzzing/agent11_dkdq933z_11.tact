// Test struct with optional of struct containing deeply nested optional

struct Inner {
    val: Int?;
}

struct Mid {
    inner: Inner?;
}

contract TestContract {
    comp: Mid?;

    init() {
        self.comp = null;
    }
}