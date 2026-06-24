struct Small {
    a: Int;
    b: Bool;
}

struct Mid {
    small1: Small;
    small2: Small;
}

struct Large {
    mid1: Mid;
    mid2: Mid;
    note: String;
    flag: Bool;
}

contract WideNested {
    data: Large;

    init() {
        self.data = Large{
            mid1: Mid{ small1: Small{a:1,b:true}, small2: Small{a:2,b:false} },
            mid2: Mid{ small1: Small{a:3,b:true}, small2: Small{a:4,b:false} },
            note: "test",
            flag: true
        };
    }
}