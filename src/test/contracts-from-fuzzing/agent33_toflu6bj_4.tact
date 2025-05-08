struct InnerMost { n: Int?; }
struct Inner { m: InnerMost?; k: Bool; }
struct Outer { data: Inner; }

contract TestContract {
    outerData: Outer;

    init() {
        self.outerData = Outer{ data: Inner{ m: null, k: true } };
    }
}