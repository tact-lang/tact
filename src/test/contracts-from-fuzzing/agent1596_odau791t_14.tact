struct SInner {
    x: Int;
    y: Bool;
}
struct SOuter {
    one: Int;
    two: SInner;
    three: String;
}
contract NestedWideFields {
    f: SOuter = SOuter{
        one: 1,
        two: SInner{ x: 2, y: true },
        three: "hello"
    };

    receive() {
        let _ = self.f.two.y;
    }
}