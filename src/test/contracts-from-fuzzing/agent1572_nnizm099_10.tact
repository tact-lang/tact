struct Deep {
    i: Int?;
    b: Bool?;
    s: String?;
}

struct Upper {
    d1: Deep;
    d2: Deep?;
    done: Bool;
}

contract OptNested {
    nested: Upper = Upper{
        d1: Deep{i:null, b:null, s:null},
        d2: null,
        done: false
    };

    init() {
        self.nested = Upper{
            d1: Deep{i:1, b:true, s:"abc"},
            d2: Deep{i:null, b:false, s:null},
            done: true
        };
    }
}
