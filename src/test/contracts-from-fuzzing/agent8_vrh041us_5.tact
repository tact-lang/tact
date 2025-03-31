contract ControlFlowReceiver {
    counter: Int = 0;

    receive(msg: String) {
        try {
            if (msg == "success") {
                self.counter = self.counter + 1;
                return;
            } else if (msg == "fail") {
                throw(404);
            } else {
                self.counter = 999; // fallthrough branch
            }
        } catch (e) {
            self.counter = e; // record error code
            return;
        }
    }
}
