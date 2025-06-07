struct A { x: Int; }
struct B { y: Int; }
struct Container { left: A?; right: B?; middle: Int?; }

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            left: null,
            right: B{ y: 7 },
            middle: null,
        };
    }
}