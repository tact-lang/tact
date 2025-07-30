struct Level3 {
    val: Int = 3;
}

struct Level2 {
    inner3: Level3? = null;
    flag: Bool = false;
}

struct Level1 {
    inner2: Level2 = Level2{};
}

contract TestContract {
    storage: Level1 = Level1{ inner2: Level2{ inner3: null, flag: true } };

    init() {
        self.storage = Level1{
            inner2: Level2{
                inner3: Level3{ val: 99 },
                flag: false,
            }
        };
    }

    receive() {
        if (self.storage.inner2.inner3 != null) {
            let _ = self.storage.inner2.inner3!!.val;
        }
    }
}