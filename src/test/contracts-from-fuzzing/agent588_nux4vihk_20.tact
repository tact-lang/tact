struct C { val: Int?; }
struct B { nested: C; }
struct A { nested: B; }

contract ChainParam(
    a: A,
) {
    receive() {
        let _ = self.a.nested.nested.val;
    }
}