struct DeepStruct1 { x: Int; }
struct DeepStruct2 { x: DeepStruct1; }
struct DeepStruct3 { x: DeepStruct2; }
struct DeepStruct4 { x: DeepStruct3; }
struct DeepStruct5 { x: DeepStruct4; }

contract TestContract {
    data: DeepStruct5;

    init() {
        self.data = DeepStruct5{ x: DeepStruct4{ x: DeepStruct3{ x: DeepStruct2{ x: DeepStruct1{ x: 5 } } } } };
    }
}