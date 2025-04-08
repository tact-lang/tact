struct NestedStruct {
    val: Int;
    text: String;
    flag: Bool;
}

contract TestContract {
    s1: NestedStruct;
    s2: NestedStruct?;

    init() {
        self.s1 = NestedStruct{ val:1, text:"abc", flag:true };
        self.s2 = null;
    }
}