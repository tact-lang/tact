// Contract with deeply nested structs and mix of optionals / defaults
struct Deep1 {
    a: Int = 1;
    b: Deep2?;
}

struct Deep2 {
    c: Int?;
    d: Deep3?;
}

struct Deep3 {
    e: Bool = true;
    f: String?;
}

contract TestContract {
    val: Deep1;
    init() {
        self.val = Deep1{
            b: Deep2{
                c: null,
                d: Deep3{
                    f: null
                }
            }
        };
    }
}