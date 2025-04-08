struct OptionalDeepNested3 {
    val: Int?;
}

struct OptionalDeepNested2 {
    child: OptionalDeepNested3?;
}

struct OptionalDeepNested1 {
    child: OptionalDeepNested2?;
}

contract OptionalDeepNest {
    data: OptionalDeepNested1;
    init() {
        self.data = OptionalDeepNested1{
            child: null
        };
    }
}