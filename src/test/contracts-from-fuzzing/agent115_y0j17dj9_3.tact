struct Deep1 {
    f1: Int;
}

struct Deep2 {
    f2: Deep1;
}

struct Deep3 {
    f3: Deep2;
}

struct Deep4 {
    f4: Deep3;
}

contract DeepNestedContract {
    val: Deep4;

    init() {
        self.val = Deep4{
            f4: Deep3{
                f3: Deep2{
                    f2: Deep1{
                        f1: 123
                    }
                }
            }
        };
    }
}