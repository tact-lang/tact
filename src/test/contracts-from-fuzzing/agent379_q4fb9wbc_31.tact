struct StrangelyOrdered {
    b: Bool;
    x: Int;
    s: String;
    q: Bool;
    y: Int;
}

contract StrangeFieldOrder {
    f: StrangelyOrdered;

    init() {
        self.f = StrangelyOrdered{ b:true, x:1, s:"s", q:false, y:2 };
    }
}