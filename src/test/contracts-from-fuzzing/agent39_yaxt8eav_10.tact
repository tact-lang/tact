struct HasBool {
    val: Bool;
    optVal: Bool?;
}

contract BoolContract {
    data: HasBool;

    init() {
        self.data = HasBool{
            val: true,
            optVal: null,
        };
    }
}