struct Deep {
    alpha: Int = 1;
    beta: Bool = true;
}

message(555) MiddleMsg {
    gamma: Int = 77;
    delta: Bool = false;
}

struct Top {
    innerStruct: Deep = Deep{};
    innerMsg: MiddleMsg = MiddleMsg{};
    flag: Bool = false;
}

contract TestContract {
    state: Top = Top{ innerStruct: Deep{ alpha: 10, beta: false }, innerMsg: MiddleMsg{ gamma: 99, delta: true }, flag: true };

    init() {
        self.state = Top{ innerStruct: Deep{ alpha: 100, beta: true }, innerMsg: MiddleMsg{ gamma: 88, delta: false }, flag: false };
    }

    receive() {
        let _ = self.state.innerMsg.gamma + self.state.innerStruct.alpha;
    }
}