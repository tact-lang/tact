struct NestedBools {
    x: Bool = true;
    y: Bool = false;
}

struct DeepStruct {
    i: Int = 42;
    bs: NestedBools;
    s: String = "hello";
}

contract DeepBoolStruct {
    ds: DeepStruct;

    init() {
        self.ds = DeepStruct{
            i: 7,
            bs: NestedBools{
                x: false,
                y: true
            },
            s: "world"
        };
    }
}