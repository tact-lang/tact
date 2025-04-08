struct NestedOption {
    val: Int?;
}

contract OptDefaultContract {
    nested: NestedOption;

    init() {
        self.nested = NestedOption{
            val: null
        };
    }
}