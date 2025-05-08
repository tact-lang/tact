struct DeepNested { x: Int; y: Bool; }

struct Middle { inner: DeepNested; flag: Bool; }

struct Outer { wrap: Middle; val: Int; }

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            wrap: Middle{ inner: DeepNested{ x: 1, y: false }, flag: true },
            val: 5
        };
    }
}