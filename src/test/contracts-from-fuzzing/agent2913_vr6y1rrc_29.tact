contract OptionalCyclicTest {
    s1: Int?;
    s2: Int?;
    s3: Int?;
    
    init() {
        self.s1 = null;
        self.s2 = 42;
        self.s3 = null;
    }
}