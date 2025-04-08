struct InnerMost { val: Int?; }

struct Middle { inner: InnerMost; flag: Bool; }

struct Outer { mid: Middle; count: Int; }

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{ inner: InnerMost{ val: null }, flag: true },
            count: 42
        };
    }
}