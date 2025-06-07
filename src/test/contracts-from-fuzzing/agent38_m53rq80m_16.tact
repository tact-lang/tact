struct L10 { A: Int; }

struct L9 { Child: L10; }

struct L8 { Child: L9; }

struct L7 { Child: L8; }

struct L6 { Child: L7; }

struct L5 { Child: L6; }

struct L4 { Child: L5; }

struct L3 { Child: L4; }

struct L2 { Child: L3; }

struct L1 { Child: L2; }

message DeepChainMsg {
    Chain: L1;
}

contract TestDeepChain {
    receive(msg: DeepChainMsg) {
        // Navigate through 9 levels of nested structs: L1.Child->L2.Child->...->L9.Child (which is L10) and then access field A
        let value: Int = msg.Chain.Child.Child.Child.Child.Child.Child.Child.Child.Child.A;
    }
}
