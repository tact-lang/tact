contract ManyIndependentFieldsTest {
    x: Int;
    y: Int;
    z: Int;
    flag1: Bool;
    flag2: Bool;
    str1: String;
    str2: String;

    init() {
        self.x = 1;
        self.y = 2;
        self.z = 3;
        self.flag1 = true;
        self.flag2 = false;
        self.str1 = "foo";
        self.str2 = "bar";
    }
}