struct ManyOpts {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Int?;
    f: Bool?;
    g: String?;
}

contract ManyOptionalsTest {
    val: ManyOpts;

    init() {
        self.val = ManyOpts{
            a: null, b: 42, c: null, d: "hi", e: null, f: true, g: null
        };
    }

    receive() {
        let tmp = self.val;
    }
}