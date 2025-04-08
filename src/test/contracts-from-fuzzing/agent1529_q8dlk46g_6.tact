struct Inner { flag: Bool; info: String; }

struct Outer {
    a: Int;
    b: Inner;
    c: Int?;
}

contract MixedOptNested {
    val: Outer;

    init() {
        self.val = Outer{
            a: 10,
            b: Inner{ flag:true, info:"zzz" },
            c: null
        };
    }
}
