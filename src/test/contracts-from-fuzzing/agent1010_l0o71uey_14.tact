struct DeepStruct1 {
    a: Int;
}
struct DeepStruct2 {
    b: DeepStruct1;
}
struct DeepStruct3 {
    c: DeepStruct2;
}
struct DeepStruct4 {
    d: DeepStruct3;
}
contract ChainDeepNest {
    nested: DeepStruct4;
    init() {
        self.nested = DeepStruct4{
            d: DeepStruct3{
                c: DeepStruct2{
                    b: DeepStruct1{
                        a: 123,
                    }
                }
            }
        };
    }
}