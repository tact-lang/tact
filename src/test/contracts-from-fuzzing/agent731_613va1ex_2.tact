struct ComplexLevel3 {
    x: Int = 3;
    y: String = "deep";
    flag: Bool = true;
}

struct ComplexLevel2 {
    nested: ComplexLevel3;
    name: String = "lvl2";
    optInt: Int?;
}

struct ComplexLevel1 {
    nested: ComplexLevel2;
    id: Int = 1;
}

contract DeepContract {
    data: ComplexLevel1;

    init() {
        self.data = ComplexLevel1{ nested: ComplexLevel2{ nested: ComplexLevel3{} }, id: 42 };
    }
}