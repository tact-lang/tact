contract TestOptionalGetter {
    // Persistent state variable of optional type, left uninitialized (defaults to null)
    opt: Int?;

    receive() {}

    // Getter that returns an optional Int (expected to be null by default)
    get fun getOpt(): Int? {
        return self.opt;
    }
}
