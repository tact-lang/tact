struct SomeNested {
    val1: Int;
    val2: Bool;
}

contract UseInManyVars {
    field1: SomeNested;
    field2: SomeNested;
    field3: SomeNested;
    init() {
        self.field1 = SomeNested{val1:1,val2:true};
        self.field2 = SomeNested{val1:2,val2:false};
        self.field3 = SomeNested{val1:3,val2:true};
    }
}
