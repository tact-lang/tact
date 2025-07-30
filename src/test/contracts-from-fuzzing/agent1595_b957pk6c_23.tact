// Several contract fields with default values overridden in init
contract TestContract {
    x: Int = 2;
    y: Bool = false;
    s: String = "init";
    opt: Bool?;

    init() {
        self.x = 10;
        self.y = true;
        self.s = "overridden";
        self.opt = null;
    }
}