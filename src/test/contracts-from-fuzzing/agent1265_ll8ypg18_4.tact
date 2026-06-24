struct Deep1 { f: Int }
struct Deep2 { d1: Deep1 }
struct Deep3 { d2: Deep2 }
struct Deep4 { d3: Deep3 }

contract C {
    storage: Deep4;
    init() {
        self.storage = Deep4{
            d3: Deep3{
                d2: Deep2{
                    d1: Deep1{ f: 42 }
                }
            }
        };
    }
}