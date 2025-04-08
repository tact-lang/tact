struct Flat {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
}

contract ManyAlternatives {
    flat: Flat;

    init() {
        self.flat = Flat{a:1, b:true, c:2, d:false, e:3, f:true};
    }
}