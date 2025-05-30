struct S1 { a:Int }
struct S2 { b:Int; s:S1 }
struct S3 { c:Int; s:S2 }
struct S4 { d:Int; s:S3 }
struct S5 { e:Int; s:S4 }
struct S6 { f:Int; s:S5 }

contract Nest6 {
    store: S6;
    init() {
        self.store = S6{ f:1, s:S5{ e:2, s:S4{ d:3, s:S3{ c:4, s:S2{ b:5, s:S1{ a:6 } } } } } };
    }
    receive() {
        self.store = self.store;
    }
}