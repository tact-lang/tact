struct HasBool {
    b: Bool;
}
contract BoolField {
    field: HasBool;
    init() {
        self.field = HasBool{b:true};
    }
}
