// mixing lots of optional primitive fields
contract TestContract {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
    bu: Builder?;

    init() {
        self.i = null;
        self.b = null;
        self.s = null;
        self.a = null;
        self.c = null;
        self.sl = null;
        self.bu = null;
    }

    receive() {
        let _ = self.i;
        let _ = self.b;
        let _ = self.s;
        let _ = self.a;
        let _ = self.c;
        let _ = self.sl;
        let _ = self.bu;
    }
}