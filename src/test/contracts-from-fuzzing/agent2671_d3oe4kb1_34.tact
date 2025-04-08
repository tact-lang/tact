// deeply nested structure
struct L1 { a: Int; }
struct L2 { b: L1; }
struct L3 { c: L2; }
struct L4 { d: L3; }
struct L5 { e: L4; }
struct L6 { f: L5; }

contract DeepNest6 {
    stuff: L6;

    init() {
        self.stuff = L6{ f: L5{ e: L4{ d: L3{ c: L2{ b: L1{ a:99 }}}}} };
    }
}