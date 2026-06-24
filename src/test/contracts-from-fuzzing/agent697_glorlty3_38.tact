struct SmallNested {
    val: Int;
}

struct MedNested {
    nest: SmallNested;
    flag: Bool;
}

struct LargeNested {
    middle: MedNested;
    s: String;
}

contract NestedSizeVariety {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            middle: MedNested{ nest: SmallNested{ val: 99 }, flag: true },
            s: "foo"
        };
    }
}