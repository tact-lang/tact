// Reduce nesting to 9 instead of 11, in case there's depth parsing limit
struct L1 { v: L2 }
struct L2 { v: L3 }
struct L3 { v: L4 }
struct L4 { v: L5 }
struct L5 { v: L6 }
struct L6 { v: L7 }
struct L7 { v: L8 }
struct L8 { v: L9 }
struct L9 { n: Int }

contract TestContract {
    deep: L1;

    init() {
        self.deep = L1{ v: L2{ v: L3{ v: L4{ v: L5{ v: L6{ v: L7{ v: L8{ v: L9{ n: 42 } } } } } } } } };
    }
}