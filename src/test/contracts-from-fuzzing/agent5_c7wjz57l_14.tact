contract TestContract {
    a: Int = ascii("Tact");

    receive() {
        dump(self.a);
    }
}
