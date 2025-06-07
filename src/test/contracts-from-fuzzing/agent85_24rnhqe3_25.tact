struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Bool;
}

contract Comb {
    x: Combo;
    init() {
        self.x = Combo{
            a:1, b:true, c:"x", d:false
        };
    }
}