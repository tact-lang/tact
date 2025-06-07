struct NestDefaults {
    a: Int = 1;
    b: String = "hey";
    c: Int?;
}

contract DefaultsTest {
    data: NestDefaults;

    init() {
        self.data = NestDefaults{
            c: null
        };
    }
}
