contract TestContract {
    s1: String = "hello";
    s2: String = "world";
    s3: String;
    flag: Bool;

    init() {
        self.s3 = "!";
        self.flag = true;
    }
}