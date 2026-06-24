// Nested optional string serialization test
struct InnerStrOpt {
    x: String?;
}

struct OuterStrOpt {
    i: InnerStrOpt?;
}

contract OptionalNestedString {
    data: OuterStrOpt;

    init() {
        self.data = OuterStrOpt{i:null};
    }
}