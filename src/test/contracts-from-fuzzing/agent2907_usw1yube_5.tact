struct DeepStruct1 {
    a: Int;
}

struct DeepStruct2 {
    b: DeepStruct1;
}

struct DeepStruct3 {
    c: DeepStruct2;
}

contract DeepNestContract {
    field: DeepStruct3;
    init() {
        self.field = DeepStruct3{ c: DeepStruct2{ b: DeepStruct1{ a: 7 } } };
    }
}