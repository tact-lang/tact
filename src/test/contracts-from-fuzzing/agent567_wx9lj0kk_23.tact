// test large struct + one optional deep nested at the end
struct BigStruct {
    a1: Int = 1;
    a2: Int = 2;
    a3: Int = 3;
    a4: Int = 4;
    a5: Int = 5;
    a6: Int = 6;
    a7: Int = 7;
    a8: Int = 8;
    a9: Int = 9;
    a10: Int = 10;
    nested: TinyNested?;
}

struct TinyNested {
    val: Int = 100;
    txt: String = "ts";
}

contract BigMix {
    s: BigStruct;
    init() {
        self.s = BigStruct{
            a1:11,a2:22,a3:33,a4:44,a5:55,a6:66,a7:77,a8:88,a9:99,a10:111,
            nested: TinyNested{val:999,txt:"wow"}
        };
    }
}
