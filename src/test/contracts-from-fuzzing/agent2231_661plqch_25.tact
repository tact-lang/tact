struct AOptionB {
    number: Int;
    nested: BInside?;
}

struct BInside {
    flag: Bool;
    comment: String?;
}

contract AOptionBContract {
    data: AOptionB;

    init() {
        self.data = AOptionB{
            number: 1,
            nested: null
        };
    }
}