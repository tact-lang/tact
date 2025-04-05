trait TState {
    s: Int;
}

contract CS(s: Int) with TState {
    // No explicit override in init, contract parameter 's' is used
    receive() {
        dump(self.s);
    }
}
