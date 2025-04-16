struct Weird {
    x: Int as int1;
    y: Int as int257 = -1;
    z: Int as uint256 = 1;
    a: String? = null;
    b: Bool? = null;
    c: String;
}

contract BugCandidate {
    weird: Weird?;

    init() {
        self.weird = Weird{
            x: 0,
            y: -1,
            z: 1,
            a: null,
            b: null,
            c: "hello"
        };
    }
}