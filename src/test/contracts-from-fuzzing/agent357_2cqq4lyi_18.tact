struct OptionalTopLevel {
    inner: InnerOpt?;
}

struct InnerOpt {
    val1: Int?;
    val2: Bool?;
}

contract OptionalTopLevelStructStorage {
    data: OptionalTopLevel;

    init() {
        self.data = OptionalTopLevel{
            inner: null,
        };
    }
}