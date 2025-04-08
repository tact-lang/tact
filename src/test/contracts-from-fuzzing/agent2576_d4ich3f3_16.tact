struct InnerA { a: Int }
struct InnerB { b: Bool }

struct MixedStruct {
    first: InnerA;
    second: String;
    third: InnerB;
    fourth: String?;
}

contract StructsNestedMix {
    data: MixedStruct;

    init() {
        self.data = MixedStruct{
            first: InnerA{a: 5},
            second: "test",
            third: InnerB{b:true},
            fourth: null
        };
    }
}