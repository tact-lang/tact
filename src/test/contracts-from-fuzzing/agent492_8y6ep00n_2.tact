struct OptionalNested {
    inner: Int?;
}

contract TestContract {
    data: OptionalNested;
    
    init() {
        self.data = OptionalNested{
            inner: null
        };
    }
}