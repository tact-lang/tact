contract ManyOptionals {
    a: Int? = null;
    b: Int? = null;
    c: Bool? = null;
    d: String? = null;
    e: Int? = null;
    f: Bool? = null;
    g: String? = null;
    h: Int? = null;
    i: Bool? = null;
    j: String? = null;
    k: Int? = null;
    l: Bool? = null;
    m: String? = null;
    n: Int? = null;
    o: Bool? = null;

    receive() {
        if (self.a != null) { let _ = self.a!!; }
    }
}