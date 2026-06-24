struct DeepNested {
    innerBool: Bool?;
    innerInt: Int;
}

struct Middle {
    deep: DeepNested;
    middleVal: Bool;
}

struct Outer {
    mid: Middle;
    outerVal: Int?;
}

contract TestContract {
    persist: Outer;

    init() {
        self.persist = Outer{
            mid: Middle{
                deep: DeepNested{
                    innerBool: false,
                    innerInt: 77,
                },
                middleVal: true,
            },
            outerVal: 123,
        };
    }
}