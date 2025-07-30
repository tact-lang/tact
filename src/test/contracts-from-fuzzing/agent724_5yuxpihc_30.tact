struct NestedOptStruct {
    s: Int?;
    t: String?;
}

contract OptStructAsFieldOptional {
    val: NestedOptStruct?;

    init() {
        self.val=null;
    }
}