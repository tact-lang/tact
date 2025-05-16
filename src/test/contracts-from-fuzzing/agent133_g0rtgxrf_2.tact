struct A { a: Int; b: Bool; }
struct B { x: A; y: A?; z: Bool; }

contract TestStorage {
    field: B;

    init() {
        self.field = B{
            x: A{a: 1, b: true},
            y: null,
            z: false,
        };
    }
}
