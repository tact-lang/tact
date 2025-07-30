contract TestContract {
    x: Int = 42;
    y: Bool = false;
    z: String = "test";
    opt1: Int? = null;

    init() {}

    receive() {
        dump(self.x);
        dump(self.y);
        dump(self.z);
        dump(self.opt1);
    }
}