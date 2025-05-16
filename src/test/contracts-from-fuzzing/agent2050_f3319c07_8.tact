struct BigNested {
  s1: String;
  s2: String?;
  i1: Int;
  i2: Int?;
  
  inner: Inner;
}

struct Inner {
  val1: Int;
  val2: Bool;
  veryInner: VeryInner;
}

struct VeryInner {
  str: String?;
  num: Int?;
  flag: Bool?;
}

contract HugeNest {
    store: BigNested;

    init() {
        self.store = BigNested{
            s1: "hi",
            s2: null,
            i1: 10,
            i2: null,
            inner: Inner{
                val1:5,
                val2:true,
                veryInner: VeryInner{
                    str:null,
                    num:null,
                    flag:null
                }
            }
        };
    }
}