message(42) Msg { earlyReturn: Bool }

contract Test(x: Int) {
    receive() {
        // deploy
    }

    receive(msg: Msg) {
        if (msg.earlyReturn) {
            self.x = 43;
            return;
        }
        self.x = 44;
    }

    get fun getX(): Int {
        return self.x;
    }
}
