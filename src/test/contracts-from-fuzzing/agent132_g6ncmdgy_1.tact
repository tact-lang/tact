struct SimpleStruct { field: Int; }

contract TestContract {
    data: SimpleStruct;
    
    init() {
        self.data = SimpleStruct{ field: 123 };
    }
}