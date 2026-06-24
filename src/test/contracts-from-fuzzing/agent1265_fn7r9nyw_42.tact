struct Inner1 { val: Int; }
struct Inner2 { val: String; }

struct TopStruct {
    i1: Inner1;
    i2: Inner2;
    flag: Bool?;
}

contract MixedNested {
    top: TopStruct;

    init() {
        self.top = TopStruct{
            i1: Inner1{ val:5 },
            i2: Inner2{ val:"" },
            flag: null
        };
    }
}