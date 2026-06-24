struct Deep {
    lvl1: Int;
    lvl2: InnerDeep;
}

struct InnerDeep {
    mid: Int;
    lvl3: Innermost;
}

struct Innermost {
    bottom: Int;
}

contract TestContract {
    data: Deep = Deep{
        lvl1: 1,
        lvl2: InnerDeep{
            mid: 2,
            lvl3: Innermost{bottom: 3}
        }
    };

    init() {
        self.data = Deep{
            lvl1: 10,
            lvl2: InnerDeep{
                mid: 20,
                lvl3: Innermost{bottom: 30}
            }
        };
    }
}
