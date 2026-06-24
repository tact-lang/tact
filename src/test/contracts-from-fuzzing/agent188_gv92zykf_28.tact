struct HasBool {
    a: Bool;
}

contract BoolStruct {
    data: HasBool;
    init() {
        self.data = HasBool{
            a: true
        };
    }
}
