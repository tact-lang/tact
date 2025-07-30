struct A1 { f: Int }
struct A2 { f: Int }
struct NestedDup {
    a: A1;
    b: A2;
}

contract TestDupStructs {
    val: NestedDup;

    init() {
        self.val = NestedDup{ a: A1{f:1}, b: A2{f:2} };
    }
}