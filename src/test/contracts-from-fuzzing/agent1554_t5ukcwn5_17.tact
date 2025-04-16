struct FirstLevel {
    s: SecondLevel;
    b: Bool;
}

struct SecondLevel {
    s: ThirdLevel;
}

struct ThirdLevel {
    val: Int?;
}

contract OptionalDeep {
    data: FirstLevel;

    init() {
        self.data = FirstLevel{
            s: SecondLevel{
                s: ThirdLevel{
                    val: null
                }
            },
            b: false
        };
    }
}