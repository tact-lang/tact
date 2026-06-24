struct Level3 {
    value: Int = 7;
}

struct Level2 {
    inner: Level3?;
}

struct Level1 {
    inner: Level2?;
}

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{
            inner: Level2{
                inner: Level3{
                    value: 999
                }
            }
        };
    }

    receive() {
        if (self.deep.inner != null) {
            let l2 = self.deep.inner!!;
            if (l2.inner != null) {
                let l3 = l2.inner!!;
                let v = l3.value;
            }
        }
    }
}