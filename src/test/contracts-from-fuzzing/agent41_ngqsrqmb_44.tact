// Optional struct wrapping struct with optional
struct Inner {
    a: Int?;
    b: Bool;
}

struct Mid {
    inner: Inner?;
    note: String;
}

contract OptionalWrapStruct {
    data: Mid?;
    init() {
        self.data = null;
    }
}