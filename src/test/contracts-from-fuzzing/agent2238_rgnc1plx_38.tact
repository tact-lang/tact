// Deliberately large nested struct with many levels and mixed optional
struct L1 { f: Bool; next: L2; }
struct L2 { f: Int?; next: L3; }
struct L3 { f: String; next: L4?; }
struct L4 { f: Int; }

contract TestContract {
    deep: L1;
    init() {
        self.deep = L1{
            f:true,
            next: L2{
                f:null,
                next: L3{
                    f:"str",
                    next: null
                }
            }
        };
    }
}
