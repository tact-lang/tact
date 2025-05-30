struct LargeNestedStruct {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int;
    h: Bool;
}

contract NestedInStructTest {
    nested1: LargeNestedStruct;
    nested2: LargeNestedStruct;

    init() {
        self.nested1 = LargeNestedStruct{
            a:1,b:true,c:2,d:false,e:3,f:true,g:4,h:false
        };
        self.nested2 = LargeNestedStruct{
            a:10,b:false,c:20,d:true,e:30,f:false,g:40,h:true
        };
    }
}
