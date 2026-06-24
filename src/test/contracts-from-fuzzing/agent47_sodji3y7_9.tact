struct Level3 { x: Int; }
struct Level2 { inner: Level3; }
struct Level1 { inner: Level2; }

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{
            inner: Level2{
                inner: Level3{ x: 77 }
            }
        };
    }
}