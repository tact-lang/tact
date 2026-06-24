struct OptionalNested {
    id: Int;
    val: String?;
}

contract TestOptionalNested {
    data: OptionalNested;
    
    init() {
        self.data = OptionalNested{
            id: 42,
            val: null,
        };
    }
}