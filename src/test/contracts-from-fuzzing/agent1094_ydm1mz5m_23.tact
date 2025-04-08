struct Tiny {
    a:Int;
}
struct Small {
    t: Tiny;
    b: Int;
}
struct Medium {
    s: Small;
    c: Int;
}
struct Large {
    m: Medium;
    d: Int;
}

contract VeryNested {
    value: Large;
    init() {
        self.value = Large{
            m: Medium{
                s: Small{
                    t: Tiny{a:42},
                    b:43
                },
                c:44
            },
            d:45
        };
    }
}