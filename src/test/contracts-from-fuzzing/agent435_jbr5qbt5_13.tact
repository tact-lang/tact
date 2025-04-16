// Contract with long list of optional primitive fields, all null by default
contract TestContract {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: Cell? = null;
    e: String? = null;
    f: Int? = null;
    g: Bool? = null;
    h: Address? = null;
    i: Cell? = null;
    j: String? = null;
    k: Int? = null;
    l: Bool? = null;
    m: Address? = null;
    n: Cell? = null;
    o: String? = null;
    p: Int? = null;
    q: Bool? = null;
    r: Address? = null;
    s: Cell? = null;
    t: String? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.d = emptyCell();
        self.j = "hello";
    }
}
