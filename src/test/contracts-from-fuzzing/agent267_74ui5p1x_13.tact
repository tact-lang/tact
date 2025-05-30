struct Innermost {
    v: Int;
}

struct Middle {
    m: Innermost;
}

struct Outer {
    o: Middle;
}

contract DeepMulti {
    data: Outer;

    init() {
        self.data = Outer{
            o: Middle{
                m: Innermost{ v: 3 }
            }
        };
    }
}