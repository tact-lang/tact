// nested optional structs with default inner nulls
struct NestedO1 {
    inner: NestedO2?;
}

struct NestedO2 {
    inner: NestedO3?;
}

struct NestedO3 {
    val: Int?;
}

contract TestNestedOpt {
    data: NestedO1;
    init() {
        self.data = NestedO1{ inner: null };
    }
}