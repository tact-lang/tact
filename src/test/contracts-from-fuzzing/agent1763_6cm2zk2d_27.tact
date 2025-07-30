struct DeepChain {
    next: DeepChainOpt?;
}

struct DeepChainOpt {
    next: DeepChainFinal?;
}

struct DeepChainFinal {
    value: Int?;
}

contract TestContract(d: DeepChain) {
    receive() {
        let _ = self.d;
    }
}