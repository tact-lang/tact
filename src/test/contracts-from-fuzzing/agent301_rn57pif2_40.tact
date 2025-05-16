contract TestContract {
    str: String? = null;

    receive() {
        let _ = self.str;
    }
}