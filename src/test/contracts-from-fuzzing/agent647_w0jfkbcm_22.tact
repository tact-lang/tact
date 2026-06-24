// Struct with nested optional struct with optional fields inside
struct InnerOptionField {
    i: Int?;
    s: String?;
}

struct OuterOptional {
    inner: InnerOptionField?;
}

contract TestContract {
    field: OuterOptional;

    init() {
        self.field = OuterOptional{ inner: null };
    }
}