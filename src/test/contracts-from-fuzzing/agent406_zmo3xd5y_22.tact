struct A { x:Int; }
struct B { y:Int; }

contract Both(
    a: A,
    b: B,
) {
    receive() {
        let _ = self.a.x + self.b.y;
    }
}