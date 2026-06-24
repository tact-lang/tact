// deeply nested optional chain assigned null at contract level
struct A1 { v: Int; }
struct A2 { f: A1?; }
struct A3 { f: A2?; }
struct A4 { f: A3?; }
contract DeepOptChain {
    val: A4;
    init() {
        self.val = A4{ f:null };
    }
}