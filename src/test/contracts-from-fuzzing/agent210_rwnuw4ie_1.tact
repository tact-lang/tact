struct NestedOption {
    inner: Int?;
}

contract TestStorage {
    field: NestedOption;
    
    init() {
        self.field = NestedOption{ inner: null };
    }
}
