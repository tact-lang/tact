contract Test6 {
    // Optional state variable, default uninitialized (should be null)
    f: Int?;

    receive() {}

    get fun getF(): Int? {
        return self.f;
    }
}
