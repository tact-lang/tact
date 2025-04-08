struct Embed {
    s: Sub;
}

struct Sub {
    s2: Sub2;
}

struct Sub2 {
    v: Int;
}

contract Compose {
    f: Embed;

    init() {
        self.f = Embed{
            s: Sub{
                s2: Sub2{ v: 77 }
            }
        };
    }
}