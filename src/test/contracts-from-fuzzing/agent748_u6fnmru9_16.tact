// Contract with persistent variables initialized partially via init
contract InitPartial {
    a: Int;
    b: Bool = false;
    c: String;

    init() {
        self.a = 123;
        self.c = "ok";
    }
}