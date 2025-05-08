struct Deep1 { a: Int; }
struct Deep2 { b: Int; d1: Deep1; }
struct Deep3 { c: Int; d2: Deep2; }
struct Deep4 { d: Int; d3: Deep3; }

contract ManyLayers {
    data: Deep4;

    init() {
        self.data = Deep4{ d: 10, d3: Deep3{ c: 20, d2: Deep2{ b: 30, d1: Deep1{a:40} } } };
    }
}