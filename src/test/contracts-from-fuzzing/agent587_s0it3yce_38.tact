struct OptStruct {
    foo: Int?;
}

contract PersistedOptStructOpt {
    s: OptStruct?;
    init() { self.s = null; }
    receive() {
        if (self.s != null){ let _ = self.s!!; }
    }
}