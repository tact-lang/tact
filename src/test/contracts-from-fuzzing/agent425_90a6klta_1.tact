struct NestedOpt {
    field1: Int?;
    field2: Bool?;
}

contract TestContract {
    data: NestedOpt;  // struct with optional fields as persistent storage

    init() {
        self.data = NestedOpt{ field1: null, field2: true };
    }
}