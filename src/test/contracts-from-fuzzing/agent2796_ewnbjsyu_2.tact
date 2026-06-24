struct Deep1 {
    lv2: Deep2;
}

struct Deep2 {
    lv3: Deep3?;
}

struct Deep3 {
    lv4: Deep4;
}

struct Deep4 {
    val: Bool?;
}

contract DeepNestedOptional {
    d: Deep1;

    init() {
        self.d = Deep1{
            lv2: Deep2{
                lv3: null
            }
        };
    }
}