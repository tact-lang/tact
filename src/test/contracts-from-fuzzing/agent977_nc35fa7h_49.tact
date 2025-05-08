// test optional boolean storage with default value
contract OptBoolDefault {
    flag: Bool? = null;
    init() {
        self.flag = true;
    }
}