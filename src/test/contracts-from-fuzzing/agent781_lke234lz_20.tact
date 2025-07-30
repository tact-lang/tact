struct Deep {
    s1: String = "A";
    s2: String?;
    inner: InnerDeep;
}

struct InnerDeep {
    flag: Bool = true;
    deeper: Deeper;
}

struct Deeper {
    num: Int = 42;
    opt: Int?;
}

contract DeepNestingCase {
    val: Deep;

    init() {
        self.val = Deep{
            s1:"B", s2:null,
            inner: InnerDeep{
                flag:false,
                deeper: Deeper{ num:99, opt:null }
            }
        };
    }
}