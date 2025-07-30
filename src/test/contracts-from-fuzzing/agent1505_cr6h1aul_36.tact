struct S {
    x: Int;
    y: String;
}

contract OptStructOpt {
    val: S?;
    init() {
        self.val = null;
    }
}