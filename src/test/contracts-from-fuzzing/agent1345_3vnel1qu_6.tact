struct Massive {
    a: Int;
    b: Int;
    c: String;
    d: Bool;
    e: Int;
    f: Bool;
    g: String;
    h: Int;
    i: String;
    j: Bool;
}

contract Test {
    mass: Massive;

    init() {
        self.mass = Massive{
            a:1, b:2, c:"c", d:true, e:5, f:false, g:"g", h:8, i:"i", j:true
        };
    }
}