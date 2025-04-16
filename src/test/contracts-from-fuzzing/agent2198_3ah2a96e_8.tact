contract DefaultAndInitTest {
    int1: Int = 5;
    int2: Int;
    bool1: Bool = true;
    str1: String;

    init() {
        self.int2 = 42;
        self.str1 = "hello";
    }
}