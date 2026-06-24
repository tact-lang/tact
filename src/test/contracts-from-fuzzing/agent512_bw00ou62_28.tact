struct LargeDefaults {
    n1: Int = 1;
    n2: Int = 2;
    n3: Int = 3;
    n4: Int = 4;
    n5: Int = 5;
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
    b1: Bool = true;
    b2: Bool = false;
}

contract LargeDefaultsTest {
    info: LargeDefaults;

    init() {
        self.info = LargeDefaults{};
    }
}
