// struct with many layers of optional nested structs, no init default
struct L4 { v: Int = 4; }
struct L3 { inner: L4?; }
struct L2 { inner: L3?; }
struct L1 { inner: L2?; }

contract TestContract {
    val: L1;

    init() {
        self.val = L1{inner:L2{inner:L3{inner:L4{v:77}}}};
    }

    receive() {
        let _ = self.val.inner;
    }
}