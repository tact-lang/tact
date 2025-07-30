// Checking optional contract storage field of struct with optionals
struct OptStruct {
    x: Int?;
    y: Bool?;
}

contract OptionalStructTop {
    field: OptStruct?;

    init() {
        self.field = null;
    }
}