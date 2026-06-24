contract TestContract {
    optVal: Int?;

    init() {
    }

    receive() {
        if (self.optVal != null) {
            let _ = self.optVal!! + 1;
        }
    }
}