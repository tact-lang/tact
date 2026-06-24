// Contract with many optional primitive persistent fields mixed with non-optional
contract TestContract {
    a: Int?;
    b: Int = 5;
    c: Bool?;
    d: Bool = false;
    e: String?;
    f: String = "x";

    init() {
        self.a = null;
        self.c = true;
        self.e = null;
    }
}