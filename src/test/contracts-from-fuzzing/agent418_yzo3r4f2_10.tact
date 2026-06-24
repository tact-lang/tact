struct Levels3 {
    lv1: Int;
    lv2: Int;
}

struct Levels2 {
    inner: Levels3;
}

struct Levels1 {
    lvl2: Levels2;
}

struct OptionWrap {
    nest: Levels1?;
}

contract MixedWrap {
    data: OptionWrap = OptionWrap{ nest: null };

    receive() {
        self.data = OptionWrap{
            nest: Levels1{
                lvl2: Levels2{
                    inner: Levels3{ lv1: 1, lv2: 2 }
                }
            }
        };
    }
}