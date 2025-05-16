struct Nested {
    x: Int;
    y: Int?;
}

contract DeepOptionalTest {
    a: Int = 0;
    b: Int?; 
    c: Nested; 
    d: Nested?; 

    init() {
        self.a = 1;
        self.b = null;
        self.c = Nested{ x: 42, y: null };
        self.d = null;
    }
}