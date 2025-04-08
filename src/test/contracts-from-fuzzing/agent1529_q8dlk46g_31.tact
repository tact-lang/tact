// purposely deep nesting + optionals combined
struct A { x:Int; }
struct B { a:A?; }
struct C { b:B?; }
struct D { c:C?; }

contract DeepOptNest {
    d: D;

    init() {
        self.d = D{ c:null };
    }
}