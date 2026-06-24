struct HasBool {
    flag: Bool;
    val: Int;
    optVal: Int?;
}

contract TestContract {
    field: HasBool;

    init() {
        self.field = HasBool{
            flag: true,
            val: 42,
            optVal: null
        };
    }
}