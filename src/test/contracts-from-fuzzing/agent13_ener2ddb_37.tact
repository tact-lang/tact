struct IntHolder { val: Int }
struct StringHolder { val: String }
struct BoolHolder { val: Bool }

struct BigStruct {
    i: IntHolder;
    s: StringHolder;
    b: BoolHolder;
}

contract NestedMix {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            i: IntHolder{ val: 42 },
            s: StringHolder{ val: "go" },
            b: BoolHolder{ val: true }
        };
    }
}