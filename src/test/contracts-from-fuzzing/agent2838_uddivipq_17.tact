struct DeepOptionStruct {
    i1: Int?;
    inner: InnerStruct?;
}

struct InnerStruct {
    s: String?;
    b: Bool;
}

contract DeepOptTest {
    val: DeepOptionStruct;

    init() {
        self.val = DeepOptionStruct {
            i1: null,
            inner: null
        };
    }
}