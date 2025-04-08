struct Chain2 {
    first: Chain3;
}
struct Chain3 {
    second: Chain4;
}
struct Chain4 {
    third: Int;
}

contract DeepChainStruct {
    nested: Chain2;

    init() {
        self.nested = Chain2{
            first: Chain3{
                second: Chain4{
                    third: 999
                }
            }
        };
    }
}