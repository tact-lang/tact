// Struct with nested optional string defaulted to null
struct OptionalStrHolder {
    s: String?;
}

contract DefaultedNestedOptStr {
    val: OptionalStrHolder;

    init() {
        self.val = OptionalStrHolder{ s: null };
    }
}