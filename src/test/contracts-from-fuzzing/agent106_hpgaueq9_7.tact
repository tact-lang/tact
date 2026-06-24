// Struct with deeply nested optional chain inside optional chain
struct Level3 { x: Int; }
struct Level2 { inner: Level3?; }
struct Level1 { inner: Level2?; }

contract LongChain {
    val: Level1 = Level1{ inner: null };

    init() {
        self.val = Level1{
            inner: Level2{
                inner: Level3{ x: 42 }
            }
        };
    }

    receive() {}
}