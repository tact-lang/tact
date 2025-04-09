struct DeepNest3 { x: Int; b: Bool; s: String; }

struct DeepNest2 { inner: DeepNest3; y: Int; }

struct DeepNest1 { inner: DeepNest2; flag: Bool; }

contract DeepNestTest {
    data: DeepNest1;

    init() {
        self.data = DeepNest1 {
            inner: DeepNest2 {
                inner: DeepNest3 {
                    x: 7,
                    b: false,
                    s: "nest"
                },
                y: 10
            },
            flag: true
        };
    }
}