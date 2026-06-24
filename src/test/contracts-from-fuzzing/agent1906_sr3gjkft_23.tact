// deeply nested optional with default inside
struct DeepDef {
    val: Int = 5;
}

struct OptNest {
    inner: DeepDef?;
}

contract DeepOptDef {
    data: OptNest;

    init() {
        self.data = OptNest{ inner: null };
    }
}
