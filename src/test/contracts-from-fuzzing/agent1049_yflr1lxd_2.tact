struct Deep1 {
    v1: Int;
}

struct Deep2 {
    v2: Deep1;
}

struct Deep3 {
    v3: Deep2;
}

contract VeryDeepNest {
    dp: Deep3;

    init() {
        self.dp = Deep3{
            v3: Deep2{
                v2: Deep1{ v1: 77 }
            }
        };
    }
}