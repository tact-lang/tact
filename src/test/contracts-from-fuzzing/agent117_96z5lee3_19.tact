struct Inner1 { x: Int; y: Bool;  }
struct Inner2 { s: String; b: Bool; }
struct Combo {
    a: Int;
    i1: Inner1;
    i2: Inner2;
    c: Bool;
}

contract ComboStruct {
    d: Combo;

    init() {
        self.d = Combo{
            a:1,
            i1:Inner1{x:2,y:true},
            i2:Inner2{s:"s",b:false},
            c:true
        };
    }
}