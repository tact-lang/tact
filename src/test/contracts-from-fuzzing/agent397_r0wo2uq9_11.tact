struct BaseLevel {
    val: Int;
}

struct Wrap1 {
    inner: BaseLevel;
}

struct Wrap2 {
    lvl1: Wrap1;
}

struct Wrap3 {
    lvl2: Wrap2;
}

struct Wrap4 {
    lvl3: Wrap3;
}

contract DeepWraps {
    data: Wrap4;

    init() {
        self.data = Wrap4{
            lvl3: Wrap3{
                lvl2: Wrap2{
                    lvl1: Wrap1{
                        inner: BaseLevel{ val: 123 }
                    }
                }
            }
        };
    }
}