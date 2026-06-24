// Contract with a contract address in a nested struct
struct InnerContractRef {
    addr: Address;
}

struct WrapInner {
    content: InnerContractRef;
}

contract DeepAddress {
    info: WrapInner;

    init() {
        self.info = WrapInner{content: InnerContractRef{addr: myAddress()}};
    }
}