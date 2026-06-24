struct Inner { x: Int; y: Bool; z: Int?; }

struct Middle { a: Int; b: Inner; c: Inner?; }

struct Outer { p: Middle; q: Middle?; }

contract NestedStructContract {
    data: Outer;

    init() {
        self.data = Outer{
            p: Middle{ a: 1, b: Inner{ x: 2, y: true, z: null }, c: null },
            q: null,
        };
    }
}