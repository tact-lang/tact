// optional with default nested struct
struct A { x: Int = 3; y: Bool = true; }

struct B { opt: A?; z: Int = 0; }

contract Test {
    data: B;

    init() {
        self.data = B{
            opt: null,
            z: 12
        };
    }
}