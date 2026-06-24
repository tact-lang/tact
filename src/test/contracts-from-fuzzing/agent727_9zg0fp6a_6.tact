struct SubStruct {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
}

struct Outer {
    nested1: SubStruct;
    nested2: SubStruct;
}

contract TwoNestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            nested1: SubStruct{
                i:1,b:true,s:"hello",a:myAddress()
            },
            nested2: SubStruct{
                i:2,b:false,s:"world",a:myAddress()
            }
        };
    }
}