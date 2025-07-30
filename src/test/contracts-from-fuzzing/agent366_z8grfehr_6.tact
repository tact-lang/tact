struct PartialDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract PartialInitTest {
    data: PartialDefaults;

    init() {
        self.data = PartialDefaults{
            b: 99
        };
    }
}