struct SInner { x: Int; y: Bool; s: String; }

contract OptionalStructTest {
    d: SInner?;

    init() {
        self.d = SInner {
            x: 101,
            y: false,
            s: "opt"
        };
    }
}