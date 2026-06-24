struct Base {
    a: Int;
}

struct Extended {
    b: Base;
    c: Int;
    d: String;
}

contract StructWithDefaultInNested {
    val: Extended;
    
    init() {
        self.val = Extended{
            b: Base{a:100},
            c: 5,
            d: "yay"
        };
    }
}