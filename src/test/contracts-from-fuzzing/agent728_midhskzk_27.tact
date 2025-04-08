struct OptFlags {
    f1: Bool?;
    f2: Bool?;
    f3: Bool?;
    val: Int;
}

contract FlagsTest {
    data: OptFlags;

    init() {
        self.data = OptFlags{
            f1: true,
            f2: null,
            f3: false,
            val: 77
        };
    }
}