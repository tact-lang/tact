struct NestedWithMultiple {
    a: Int;
    b: Bool;
    c: String;
}

contract UseMultipleNested {
    nest1: NestedWithMultiple;
    nest2: NestedWithMultiple;
    num: Int;

    init() {
        self.nest1 = NestedWithMultiple{a:1, b:true, c:"one"};
        self.nest2 = NestedWithMultiple{a:2, b:false, c:"two"};
        self.num = 123;
    }
}