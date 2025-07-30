struct Data {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    opt: Data?;
    init() {
        self.opt = null;
    }
}