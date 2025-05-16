struct L1 { a: Int }
struct L2 { b: L1 }
struct L3 { c: L2 }
struct L4 { d: L3 }
struct L5 { e: L4 }
struct L6 { f: L5 }
struct L7 { g: L6 }
struct L8 { h: L7 }

contract DeepChain8 {
    val: L8;

    init() {
        self.val = L8{ h: L7{ g: L6{ f: L5{ e: L4{ d: L3{ c: L2{ b: L1{ a: 123 } } } } } } } };
    }
}