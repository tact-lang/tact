struct ComplexSerialization {
    a: Int as uint4;
    b: Int as int16;
    c: Bool;
    d: String;
}

contract ComplexSerUse {
    data: ComplexSerialization;
    init() {
        self.data = ComplexSerialization{ 
            a: 7, b: -123, c:true, d:"data" 
        };
    }
}
