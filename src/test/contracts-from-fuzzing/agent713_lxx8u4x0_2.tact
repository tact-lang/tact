struct DeepOptional {
    a: Bool?;
    b: String?;
    c: Int?;
}

contract OptStructTest {
    val: DeepOptional;
    
    init() {
        self.val = DeepOptional{
            a: null,
            b: null,
            c: null
        };
    }
}