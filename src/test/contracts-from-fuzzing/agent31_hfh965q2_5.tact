struct L1 { x: Int; y: Int }
struct L2 { a: L1; b: L1 }
struct L3 { u: L2; v: L2 }

contract StorageTest {
    state: L3;

    init() {
        self.state = L3{
            u: L2{
                a: L1{x: 1, y: 2},
                b: L1{x: 3, y: 4}
            },
            v: L2{
                a: L1{x: 5, y: 6},
                b: L1{x: 7, y: 8}
            }
        };
    }
}