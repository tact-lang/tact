contract TestContract {
    name: String? = null;

    init() {
        self.name = null;
    }

    receive() {
        if (self.name != null) {
            let _ = self.name!!;
        }
    }
}