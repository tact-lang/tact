struct A { a: Int }
struct B { b: Int }
struct C { c: Int }
struct D { d: Int }
struct E { e: Int }

struct DeepHuge {
    aa: A; bb: B; cc: C; dd: D; ee: E;
}

contract LargeNestedStructTest {
    val: DeepHuge;
    init() {
        self.val = DeepHuge{
            aa:A{a:1}, bb:B{b:2}, cc:C{c:3}, dd:D{d:4}, ee:E{e:5}
        };
    }
}