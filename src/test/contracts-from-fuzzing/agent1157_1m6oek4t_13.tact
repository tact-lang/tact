struct ManyBools {
    flag1: Bool;
    flag2: Bool;
    opt1: Bool?;
    opt2: Bool?;
}

contract BoolsTest {
    flags: ManyBools;

    init() {
        self.flags = ManyBools{
            flag1: true,
            flag2: false,
            opt1: null,
            opt2: true
        };
    }

    receive() {
        let tmp = self.flags;
    }
}