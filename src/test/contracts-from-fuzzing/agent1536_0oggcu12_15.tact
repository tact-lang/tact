// Testing optional struct field without default
struct OptionalHolder {
    innerOpt: Inner?;
}

struct Inner {
    val: Int;
}

contract WithOptionalField {
    state: OptionalHolder;

    init() {
        self.state = OptionalHolder{ innerOpt: null };
    }
}