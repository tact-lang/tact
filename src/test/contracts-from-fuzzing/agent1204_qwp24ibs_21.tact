// override default values in init
contract DefaultsOverride {
    val: Int = 1;
    flag: Bool = false;

    init() {
        self.val = 42;
        self.flag = true;
    }
}