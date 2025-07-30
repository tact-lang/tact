struct HasBool {
    flag1: Bool;
    flag2: Bool;
    flagOpt: Bool?;
}

contract BoolTest {
    v: HasBool;

    init() {
        self.v = HasBool{
            flag1: true,
            flag2: false,
            flagOpt: null
        };
    }
}