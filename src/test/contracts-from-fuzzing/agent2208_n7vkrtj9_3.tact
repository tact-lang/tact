struct NestedStructLevel3 {
    x: Int;
}

struct NestedStructLevel2 {
    lvl3: NestedStructLevel3;
    optionalStr: String?;
}

struct NestedStructLevel1 {
    lvl2: NestedStructLevel2;
    flag: Bool;
}

contract DeepNestedContract {
    data: NestedStructLevel1;

    init() {
        self.data = NestedStructLevel1{
            lvl2: NestedStructLevel2{lvl3: NestedStructLevel3{x: 42}, optionalStr: null},
            flag: true
        };
    }
}