struct A { x: Int; }
struct B { y: Int; }

contract OptsAndStructs {
    optA: A?;
    optB: B?;

    init() {
        self.optA = null;
        self.optB = B{y:2};
    }
}