struct DeepNest3 { q: String; }
struct DeepNest2 { p: DeepNest3; b: Bool; }
struct DeepNest1 { x: Int; inner: DeepNest2; }

contract DeepNesting {
    data: DeepNest1;

    init() {
        self.data = DeepNest1{
            x: 10,
            inner: DeepNest2{
                p: DeepNest3{ q: "wow" },
                b: true,
            },
        };
    }
}