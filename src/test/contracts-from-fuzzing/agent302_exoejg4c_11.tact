struct Deep4 {
    val: Int;
}

struct Deep3 {
    d4: Deep4;
    info: String;
}

struct Deep2 {
    d3: Deep3;
}

struct Deep1 {
    d2: Deep2;
}

contract FourNestTest {
    deepVal: Deep1;

    init() {
        self.deepVal = Deep1{
            d2: Deep2{
                d3: Deep3{
                    d4: Deep4{ val: 999 },
                    info: "hello"
                }
            }
        };
    }
}