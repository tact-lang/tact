struct Inner1 { x: Int; }
struct Inner2 { y: Bool; }
struct Combined {
    s1: Inner1;
    s2: Inner2;
    val: Int;
}

contract ComboNestedVars {
    comb: Combined;
    init() {
        self.comb = Combined{ s1: Inner1{x:10}, s2: Inner2{y:true}, val:99 };
    }
}