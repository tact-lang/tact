struct OptStruct1 {
    a: Int?;
}

struct OptStruct2 {
    a: OptStruct1?;
}

contract ChainOptionals {
    x: OptStruct2;
    init() {
        self.x = OptStruct2{ a: null };
    }
}