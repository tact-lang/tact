struct OptStruct1 { a: Int?; }
struct OptStruct2 { s: OptStruct1?; }
struct OptStruct3 { s: OptStruct2?; }

contract ChainNulls {
    chain: OptStruct3;

    init() {
        self.chain = OptStruct3{
            s: OptStruct2{
                s: OptStruct1{ a: null }
            }
        };
    }
}