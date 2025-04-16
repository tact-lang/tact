struct Complex {
    a: Int = 1;
    b: Int? = null;
    c: Int;
}

contract DefaultInStruct {
    data: Complex;
    init() {
        self.data = Complex{
            c: 10
        };
    }
}