message(42) Msg1 { earlyReturn: Bool }
message(43) Msg2 { thenBranch: Bool }

contract Test(x: Int) {
    receive() {
        // deploy
    }

    receive(msg: Msg1) {
        if (msg.earlyReturn) {
            self.x = 43;
            return;
        }
        self.x = 44;
    }

    receive(msg: Msg2) {
        self.x = 47;
        if (msg.thenBranch) {
            self.x = 45;
            return;
        } else {
            self.x = 46;
            return;
        }
    }

    get fun getX(): Int {
        return self.x;
    }
}
