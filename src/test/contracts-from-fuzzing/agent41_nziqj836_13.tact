struct Level2 {
    u: Int = 2;
    v: Bool = true;
}

struct Level1 {
    inner: Level2;
    name: String = "default";
}

contract TestContract {
    val: Level1;

    init() {
        self.val = Level1{
            inner: Level2{
                v: false
            }
        };
    }

    receive() {
        self.val;
    }
}