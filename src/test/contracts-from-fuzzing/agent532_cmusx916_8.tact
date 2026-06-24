struct Chain1 {
    val: Int;
}
struct Chain2 {
    nested: Chain1;
}
struct Chain3 {
    nested: Chain2;
}
struct Chain4 {
    nested: Chain3;
}
struct Chain5 {
    nested: Chain4;
}
contract DeepChain {
    data: Chain5;

    init() {
        self.data = Chain5{
            nested: Chain4{
                nested: Chain3{
                    nested: Chain2{
                        nested: Chain1{val: 7}
                    }
                }
            }
        };
    }
}