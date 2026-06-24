// Test initializations without explicit init function defaults
contract NoInitDefaults {
    x: Int = 0;
    y: String = "";
    z: Bool = false;
    opt: Int? = null;
    textOpt: String? = null;

    receive() {
        self.x = 1;
        self.y = "x";
        self.z = true;
        self.opt = 10;
        self.textOpt = "y";
    }
}