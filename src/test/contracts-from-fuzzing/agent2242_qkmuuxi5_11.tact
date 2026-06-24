struct DeeplyNested1 { val: Int; }
struct DeeplyNested2 { val: DeeplyNested1; }
struct DeeplyNested3 { val: DeeplyNested2; }
struct DeeplyNested4 { val: DeeplyNested3; }

contract FourNest {
    nest: DeeplyNested4;

    init() {
        self.nest = DeeplyNested4{ val: DeeplyNested3{ val: DeeplyNested2{ val: DeeplyNested1{ val: 99 } } } };
    }
}