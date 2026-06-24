struct SubTest {
    info: Int = 17;
    flag: Bool = false;
}

struct Mixed {
    req1: Int;
    opt1: Int?;
    nested: SubTest;
    opt2: Bool?;
    req2: String;
}

contract MixedInterleaved {
    data: Mixed;

    init() {
        self.data = Mixed{
            req1: 1,
            opt1: null,
            nested: SubTest{},
            opt2: true,
            req2: "hello",
        };
    }
}