struct Deep1 { f1: Int; f2: String?; }
struct Deep2 { d1: Deep1; flag: Bool; }
struct Deep3 { d2: Deep2; optStr: String?; }
struct Deep4 { d3: Deep3; number: Int; }

contract TestContract {
    nested: Deep4;

    init() {
        self.nested = Deep4{
            d3: Deep3{
                d2: Deep2{
                    d1: Deep1{ f1: 0, f2: null },
                    flag: false
                },
                optStr: null
            },
            number: 0
        };
    }

    receive() {
        self.nested = Deep4{
            d3: Deep3{
                d2: Deep2{
                    d1: Deep1{ f1: 42, f2: "hi" },
                    flag: true
                },
                optStr: "world"
            },
            number: 99
        };
    }
}