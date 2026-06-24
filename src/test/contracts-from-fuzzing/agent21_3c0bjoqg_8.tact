struct DeepStruct1 {
    s2: DeepStruct2;
}
struct DeepStruct2 {
    s3: DeepStruct3;
}
struct DeepStruct3 {
    s4: DeepStruct4;
}
struct DeepStruct4 {
    value: Int;
}

contract TestContract {
    ds1: DeepStruct1;

    init() {
        self.ds1 = DeepStruct1{
            s2: DeepStruct2{
                s3: DeepStruct3{
                    s4: DeepStruct4{
                        value: 42
                    }
                }
            }
        };
    }
}