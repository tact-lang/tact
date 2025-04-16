struct BottomA { value: Int; flag: Bool; }
struct BottomB { note: String; present: Bool?; }
struct Middle {
    left: BottomA;
    right: BottomB;
}

struct Top {
    main: Middle;
    count: Int;
}

contract TreeTest {
    root: Top;

    init() {
        self.root = Top{
            main: Middle{
                left: BottomA{ value:1, flag:true },
                right: BottomB{ note:"", present:null }
            },
            count: 4
        };
    }
}