struct InnerBoolOpt {
    xb: Bool?;
}

struct MidOpt {
    inr: InnerBoolOpt?;
}

contract DeepOptChain {
    val: MidOpt = MidOpt{inr: null};

    receive() {
        self.val = MidOpt{inr: InnerBoolOpt{xb: true}};
    }
}