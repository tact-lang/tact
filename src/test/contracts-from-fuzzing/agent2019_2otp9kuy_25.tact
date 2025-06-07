// Nested struct with optional struct inside contract, all fields with explicit default
struct Inner {
    x: Int = 0;
    s: String = "";
}

struct Outer {
    inn: Inner? = null;
}

contract DefaultOptStruct {
    data: Outer;
    init() {
        self.data = Outer{};
    }
}