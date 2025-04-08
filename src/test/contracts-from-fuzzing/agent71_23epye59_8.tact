struct InnerMost { val: Int }

struct Inner { a: InnerMost; b: Int }

struct Mid { c: Inner?; d: Int }

struct Outer { e: Mid; f: Mid?; g: Int }

contract ComplexDeep {
    data: Outer;

    init() {
        self.data = Outer{
            e: Mid{ c: null, d: 1 },
            f: null,
            g: 2
        };
    }
}