struct A { x: Int }
struct B { y: A }

contract NestedPers {
    pers: B;

    init() {
        self.pers = B{y:A{x:123}};
    }
}