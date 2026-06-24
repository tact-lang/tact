struct ChildStruct {
    cval: Int = 7;
    cname: String = "child";
}

struct ParentStruct {
    pval: Int = 42;
    child: ChildStruct = ChildStruct{};
}

contract NestedStructDefaults {
    stuff: ParentStruct = ParentStruct{};
}