struct SNested {
    inn: Int;
}

struct SLevel2 {
    one: SNested;
    two: Int;
}

struct SLevel1 {
    first: SLevel2;
}

contract NestedMix {
    f: SLevel1;

    init() {
        self.f = SLevel1{
            first: SLevel2{
                one: SNested{inn:123},
                two:456
            }
        };
    }
}
