struct Descendant1 { v1: Int; b1: Bool; s1: String; }
struct Descendant2 { v2: Int; b2: Bool; s2: String; }

struct Ancestor {
    d1: Descendant1;
    d2: Descendant2;
    label: String;
    done: Bool;
}

contract ComplexField {
    a: Ancestor;

    init() {
        self.a = Ancestor{
            d1: Descendant1{v1:1,b1:true,s1:"s1"},
            d2: Descendant2{v2:2,b2:false,s2:"s2"},
            label:"ancestor",
            done:true
        };
    }
}