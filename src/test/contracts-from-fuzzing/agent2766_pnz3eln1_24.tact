struct Tiny {
    a: Bool;
}

struct Mid {
    s: Tiny;
    b: Int;
}

struct Large {
    m: Mid;
    flag: Bool;
    num: Int;
}

contract DeepLayeredContract {
    val: Large;

    init() {
        self.val = Large{
            m: Mid{
                s: Tiny{a:true},
                b: 7
            },
            flag: false,
            num: 42,
        };
    }
}