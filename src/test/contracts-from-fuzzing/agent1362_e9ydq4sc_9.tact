struct A { x: Int; y: Int; }
struct B { a: A; z: Int; }
struct C { arr1: A; arr2: B; w: Int; }

contract Test {
    val: C;

    init() {
        self.val = C{
            arr1: A{x:1,y:2},
            arr2: B{ a: A{x:3,y:4}, z:5 },
            w: 6
        };
    }
    receive() {}
}