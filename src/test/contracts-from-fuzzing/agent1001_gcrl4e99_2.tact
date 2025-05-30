struct Deep1 {
    val1: Int as uint8;
    opt1: Int?;
}

struct Deep2 {
    deep1: Deep1;
    txt: String;
}

struct Deep3 {
    deep2: Deep2;
    flag: Bool;
}

contract DeepTest {
    field: Deep3;

    init() {
        self.field = Deep3{
            deep2: Deep2{
                deep1: Deep1{ val1: 10, opt1: null },
                txt: "abc"
            },
            flag: true
        };
    }
}