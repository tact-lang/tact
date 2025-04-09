struct OptionalNest {
    lvl1: Bool?;
    lvl2: OptStruct?;
}

struct OptStruct {
    flag: Bool;
    deeper: SubOptStruct?;
}

struct SubOptStruct {
    text: String?;
    num: Int;
}

contract OptionedNestedContract {
    st: OptionalNest;

    init() {
        self.st = OptionalNest{ lvl1: null, lvl2: null };
    }
}