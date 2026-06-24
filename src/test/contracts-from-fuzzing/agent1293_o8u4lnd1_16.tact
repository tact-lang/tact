struct OptFlags {
    flag1: Bool?;
    flag2: Bool?;
    flag3: Bool?;
}

contract BoolOptTest {
    flags: OptFlags;

    init() {
        self.flags = OptFlags{
            flag1: null,
            flag2: true,
            flag3: false
        };
    }
}