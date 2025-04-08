contract TestContract {
    maybeCounter: Int?;

    init() {
        self.maybeCounter = null;
    }

    receive() {
        let c = self.maybeCounter;
        if (c != null) {
            let v = c!! + 1;
        }
    }
}