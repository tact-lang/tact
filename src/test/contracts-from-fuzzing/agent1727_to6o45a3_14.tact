// test contract with long list of mixed primitive fields
contract ManyMix {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Bool = true;
    e: Bool = false;
    f: String = "one";
    g: String = "two";
    h: Int?;
    i: Bool?;
    j: String?;
    k: Int = -42;
    l: Bool = false;
    m: String = "";
    n: Int?;

    receive() {
        self.h = 99;
        self.i = null;
        self.j = "hey";
    }
}