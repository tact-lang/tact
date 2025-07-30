struct DeeplyNested1 { fld: Int; }
struct DeeplyNested2 { deep1: DeeplyNested1; flag: Bool; }
struct DeeplyNested3 { deep2: DeeplyNested2; s: String; opt: Bool?; }

contract Test {
    nested3: DeeplyNested3;

    init() {
        self.nested3 = DeeplyNested3{
            deep2: DeeplyNested2{
                deep1: DeeplyNested1{ fld: 123 },
                flag: true
            },
            s: "hello",
            opt: null
        };
    }
}