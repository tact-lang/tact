struct BigNested {
    s: String;
    i: Int;
    b: Bool;
    optI: Int?;
    optS: String?;
    optB: Bool?;
}

struct MiddleNested {
    big1: BigNested;
    big2: BigNested;
}

struct TopNested {
    mid1: MiddleNested;
    mid2: MiddleNested;
}

contract ComplexNestedPersistent {
    data: TopNested;

    init() {
        self.data = TopNested{
            mid1: MiddleNested{
                big1: BigNested{
                    s: "a", i: 1, b: true, optI: null, optS: null, optB: null},
                big2: BigNested{
                    s: "b", i: 2, b: false, optI: null, optS: null, optB: null}
            },
            mid2: MiddleNested{
                big1: BigNested{
                    s: "c", i: 3, b: true, optI: null, optS: null, optB: null},
                big2: BigNested{
                    s: "d", i: 4, b: false, optI: null, optS: null, optB: null}
            }
        };
    }
}