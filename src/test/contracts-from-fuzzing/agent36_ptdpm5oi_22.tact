struct Strings {
    a: String = "";
    b: String = "";
}

contract EmptyStrings {
    store: Strings;

    init() {
        self.store = Strings{ a: "", b: "" };
    }

    receive() {
        let _ = self.store;
    }
}