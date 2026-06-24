struct A { x:Int; }

struct B { a:A; }

struct C { b:B; }

contract ManyLayers {
    val: C;
    init() {
        self.val = C{b:B{a:A{x:10}}};
    }
}