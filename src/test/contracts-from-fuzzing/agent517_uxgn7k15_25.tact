struct Sibling1 {
    x: Int;
    y: Bool;
}

struct Sibling2 {
    s: String;
    addr: Address;
}

struct ParentStruct {
    sib1: Sibling1;
    sib2: Sibling2;
}

contract SiblingTest {
    val: ParentStruct;

    init() {
        self.val = ParentStruct{
            sib1: Sibling1{x:0,y:false},
            sib2: Sibling2{s:"hi", addr:myAddress()}
        };
    }
}