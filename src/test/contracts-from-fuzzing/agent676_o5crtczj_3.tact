struct DeepLevel3 {
    a: Int;
    b: Bool;
    s: String;
}

struct DeepLevel2 {
    x: Int?;
    d3: DeepLevel3;
}

struct DeepLevel1 {
    d2: DeepLevel2;
}

contract TestContract {
    deep: DeepLevel1;

    init() {
        self.deep = DeepLevel1{
            d2: DeepLevel2{
                x: null,
                d3: DeepLevel3{a: 5, b: true, s: "xyz"}
            }
        };
    }
}