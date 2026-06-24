trait ProvidesData {
    data: NestedFields;
}

struct NestedFields {
    info: InfoOpt?;
}

struct InfoOpt {
    val: Int?;
}

contract TestContract with ProvidesData {
    data: NestedFields;

    init() {
        self.data = NestedFields{info: null};
    }
}