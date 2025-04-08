struct BasicNested {
    value: Int;
}

contract TestContract {
    data: BasicNested;
    
    init() {
        self.data = BasicNested{ value: 42 };
    }
}