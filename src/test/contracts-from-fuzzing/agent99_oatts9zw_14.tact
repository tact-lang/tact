// Very deep nested optional chains
struct L4 { val: Int; }
struct L3 { val: L4?; }
struct L2 { val: L3?; }
struct L1 { val: L2?; }

contract StorageTest {
    test: L1;

    init() {
        self.test = L1{val: L2{val: L3{val: L4{val: 1234}}}};
    }
}