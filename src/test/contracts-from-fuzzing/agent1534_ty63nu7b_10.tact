struct DeepStruct1 {a: Int}
struct DeepStruct2 {d1: DeepStruct1}
struct DeepStruct3 {d2: DeepStruct2}
struct DeepStruct4 {d3: DeepStruct3}

contract DeepNest {
    deeply: DeepStruct4;
    init() {
        self.deeply = DeepStruct4{ d3: DeepStruct3{ d2: DeepStruct2 { d1: DeepStruct1 {a:123}}}}; 
    }
}