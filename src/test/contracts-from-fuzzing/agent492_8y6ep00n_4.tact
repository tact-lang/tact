struct NestedOptionals {
    first: Int?;
    second: Bool?;
    third: String?;
}

contract TestContract {
    data: NestedOptionals?;
    
    init() {
        self.data = null;
    }
}