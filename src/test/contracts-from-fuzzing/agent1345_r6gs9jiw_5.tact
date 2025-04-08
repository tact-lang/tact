struct OptNested {
    val: Int?;
}

contract OptionalStructTest {
    data: OptNested?;
    
    init() {
        self.data = OptNested{ val: 42 };
    }
}