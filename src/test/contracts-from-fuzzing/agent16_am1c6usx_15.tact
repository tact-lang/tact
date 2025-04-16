// optional struct with default inside
struct DefInOpt {
    f1: Int = 5;
    f2: String = "hello";
}

contract OptStructDefault {
    s: DefInOpt?;

    init() {
        self.s = null;
    }
}
