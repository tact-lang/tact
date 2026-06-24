struct Deep1 { val: Int; opt: Deep2?; }
struct Deep2 { val: Int; opt: Deep3?; }
struct Deep3 { val: Int; }

contract Test {
    data: Deep1;
    init() {
        self.data = Deep1{
            val: 1,
            opt: Deep2{
                val: 2,
                opt: Deep3{ val: 3 }
            }
        };
    }
}