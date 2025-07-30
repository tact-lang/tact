struct LargeOrderTest {
    aa: Int;
    ab: Bool;
    ac: Int?;
    ad: String;
    ae: Bool?;
    af: String?;
    ag: Int;
    ah: String;
    ai: Int?;
    aj: Bool;
    ak: String?;
}

contract LargeOrder {
    data: LargeOrderTest;

    init() {
        self.data = LargeOrderTest{
            aa: 1,
            ab: true,
            ac: null,
            ad: "abc",
            ae: null,
            af: "opt",
            ag: 7,
            ah: "foo",
            ai: 42,
            aj: false,
            ak: null,
        };
    }
}
