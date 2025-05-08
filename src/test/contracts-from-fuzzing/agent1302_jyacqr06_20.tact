struct A { x: Int; }
struct B { y: A; }

contract StructOrdering {
    first: A;
    second: B;

    init() {
        self.first = A { x: 5 };
        self.second = B { y: self.first };
    }

    receive() {
        let x = self.second.y.x;
    }
}
