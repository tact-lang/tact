struct L3 { val: Int; }
struct L2 { s3: L3?; }
struct L1 { s2: L2?; }

contract TestContract {
    s: L1? = null;
    receive() { let _ = self.s; }
}