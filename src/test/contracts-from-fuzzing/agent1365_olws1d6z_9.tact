struct InnerS1 { val: String; }
struct InnerS2 { text: String; }

struct OuterS {
    first: InnerS1;
    second: InnerS2;
    count: Int;
}

contract NestedStringStruct {
    store: OuterS;

    init() {
        self.store = OuterS{
            first: InnerS1{ val:"a" },
            second: InnerS2{ text:"b" },
            count: 10
        };
    }
}