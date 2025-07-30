struct T1 { a: Int }
struct T2 { b: T1 }
struct T3 { c: T2 }
struct T4 { d: T3 }

contract Chain {
    val: T4;
    init() {
        self.val = T4{ d: T3{ c: T2{ b: T1{ a: 42 } } } };
    }
}