contract OptAddr {
    a: Address?; // null

    receive() {
        self.a = sender();
    }
}