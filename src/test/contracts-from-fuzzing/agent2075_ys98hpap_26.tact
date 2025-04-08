struct Inner {
    field: Int?;   
}

contract NestedNull {
    data: Inner?;

    init() {
        self.data = null;
    }
}