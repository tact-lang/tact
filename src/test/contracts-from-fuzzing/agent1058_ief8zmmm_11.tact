struct Sparse {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Bool;
}

contract MixedOptionals {
    state: Sparse;

    init() {
        self.state = Sparse{ a:1, b:null, c:"hi", d:null, e:true };
    }
}