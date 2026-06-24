contract TestContract {
    // Testing compile-time function ascii on a valid string literal as a state field
    a: Int = ascii("Hello!");

    receive() {
        dump(self.a);
    }
}
