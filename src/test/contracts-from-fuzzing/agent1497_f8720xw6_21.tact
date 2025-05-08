struct S1 { x: Int }
struct S2 { a: S1 }
struct S3 { b:S2 }
struct S4 { c:S3 }
struct S5 { d:S4 }
struct S6 { e:S5 }
struct S7 { f:S6 }

contract TestContract {
    deep: S7 = S7{ f:S6{ e:S5{ d:S4{ c:S3{ b:S2{ a:S1{ x:1 } } } } } } };
}