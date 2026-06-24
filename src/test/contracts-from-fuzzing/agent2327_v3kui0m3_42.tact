struct BigNested {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
    s6: String;
}

struct MidNested {
    b1: BigNested;
    b2: BigNested;
    b3: BigNested;
}

struct TopNested {
    m1: MidNested;
    m2: MidNested;
}

contract ManyLayers {
    storage: TopNested;

    init() {
        self.storage = TopNested{
            m1: MidNested{
                b1: BigNested{ s1:"a",s2:"b",s3:"c",s4:"d",s5:"e",s6:"f" },
                b2: BigNested{ s1:"g",s2:"h",s3:"i",s4:"j",s5:"k",s6:"l" },
                b3: BigNested{ s1:"m",s2:"n",s3:"o",s4:"p",s5:"q",s6:"r" }
            },
            m2: MidNested{
                b1: BigNested{ s1:"s",s2:"t",s3:"u",s4:"v",s5:"w",s6:"x" },
                b2: BigNested{ s1:"y",s2:"z",s3:"aa",s4:"bb",s5:"cc",s6:"dd" },
                b3: BigNested{ s1:"ee",s2:"ff",s3:"gg",s4:"hh",s5:"ii",s6:"jj" }
            }
        };
    }
}
