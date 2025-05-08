contract TestContract {
    age: Int? = 18;

    init() {
        self.age = null;
    }

    receive() {
        if (self.age != null) {
            let _ = self.age!! + 1;
        }
    }
}