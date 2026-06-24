struct StrNest {
    one: String;
    two: String;
    three: String;
}

contract NestedStrings {
    sn: StrNest;
    init(){
        self.sn = StrNest{ one: "a", two: "b", three: "c" };
    }
}