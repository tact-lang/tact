struct FirstLevel {
    x: Int;
    y: Bool;
}

struct SecondLevel {
    f: FirstLevel;
}

struct ThirdLevel {
    s: SecondLevel;
}

struct FourthLevel {
    t: ThirdLevel;
}

contract FourDeepNested {
    data: FourthLevel;

    init() {
        self.data = FourthLevel{
            t: ThirdLevel{
                s: SecondLevel{
                    f: FirstLevel{
                        x: 5,
                        y: true
                    }
                }
            }
        };
    }
}