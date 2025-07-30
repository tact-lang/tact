struct StA {
    val: Int;
}
struct StB {
    st: StA;
}
struct StC {
    st: StB;
}

contract DeepChain {
    chain: StC;

    init() {
        self.chain = StC{
            st: StB{
                st: StA{
                    val: 55,
                },
            },
        };
    }
}
