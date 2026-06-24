// Struct with defaulted optional nested struct
struct Child {
    value: Int;
    label: String?;
}

struct Parent {
    child: Child? = null;
    note: String = "note";
}

contract OptionalNestedDefault {
    val: Parent;

    init() {
        self.val = Parent{};
    }
}