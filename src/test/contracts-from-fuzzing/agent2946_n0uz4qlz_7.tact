struct BoolNest {
    flag: Bool;
    more: BoolMore;
}

struct BoolMore {
    flag2: Bool;
    flag3: Bool;
}

contract ManyBools {
    val: BoolNest;
    init() {
        self.val = BoolNest{
            flag: true,
            more: BoolMore{
                flag2: false,
                flag3: true
            }
        };
    }
}