contract InitOverrideTest {
    val: Int = 5;
    flag: Bool = false;

    init() {
        self.val = 100;
        self.flag = true;
    }
}