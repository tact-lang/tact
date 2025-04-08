struct NestedOption {
    inner: Int?;
}

contract TestContract {
    data: NestedOption;
    
    init() {
        self.data = NestedOption{ inner: null };
    }
}
