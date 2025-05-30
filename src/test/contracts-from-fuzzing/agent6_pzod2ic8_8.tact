struct InnerMost {
    f1: Int;
    f2: Bool;
}

struct Inner {
    im1: InnerMost;
    im2: InnerMost;
}

struct Mid {
    i1: Inner;
    flag: Bool;
    note: String;
}

struct Container {
    m: Mid;
}

contract DeepWideNested {
    data: Container;
    
    init() {
        self.data = Container{
            m: Mid{
                i1: Inner{
                    im1: InnerMost{ f1:1, f2:true },
                    im2: InnerMost{ f1:2, f2:false }
                },
                flag: true,
                note: "ok",
            }
        };
    }
}