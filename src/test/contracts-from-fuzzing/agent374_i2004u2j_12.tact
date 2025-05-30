struct WithStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract TestContract {
    ws: WithStrings;

    init() {
        self.ws = WithStrings{
            s1: "alpha",
            s2: "beta",
            s3: "gamma"
        };
    }

    receive() {
        let _ = self.ws.s2;
    }
}