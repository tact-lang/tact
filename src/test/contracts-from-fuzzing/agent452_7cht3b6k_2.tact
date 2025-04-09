struct Inner { val: Int; }
struct Outer { a: Int; b: Inner; c: Bool }

contract Test3 {
    data: Outer;
    init() {
        self.data = Outer{
            a: 123,
            b: Inner{ val: 456 },
            c: false
        };
    }
}
