struct NestedManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
}

contract ContainsManyOptStruct {
    val: NestedManyOptionals;

    init() {
        self.val = NestedManyOptionals{ a:null, b:null, c:null, d:null };
    }
}
