struct NoDefaults {
    x: Int;
    y: Bool;
    s: String;
}

contract TestContract {
    st: NoDefaults;

    init() {
        self.st = NoDefaults{
            x: 1,
            y: true,
            s: "a",
        };
    }

    receive() {
        let _ = self.st.x;
    }
}