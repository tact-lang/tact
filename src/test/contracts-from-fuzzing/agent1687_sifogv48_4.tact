struct Lvl3 {
    lvl3: Int;
    done: Bool;
}

struct Lvl2 {
    lvl2: Int;
    innermost: Lvl3;
}

struct DeepNested {
    lvl1: Int;
    inner: Lvl2;
}

contract Test {
    storage: DeepNested;

    init() {
        self.storage = DeepNested{
            lvl1: 1,
            inner: Lvl2{
                lvl2: 2,
                innermost: Lvl3{
                    lvl3: 3,
                    done: true
                }
            }
        };
    }
}