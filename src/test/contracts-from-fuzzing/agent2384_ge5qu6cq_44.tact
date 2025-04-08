struct NestedBools {
    a: Bool;
    b: Bool;
    c: Bool;
}

contract NestedBoolStruct {
    nested: NestedBools;

    init() {
        self.nested = NestedBools{a:true,b:false,c:true};
    }
}