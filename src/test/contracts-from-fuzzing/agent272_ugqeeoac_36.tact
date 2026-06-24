// large deeply nested struct with many fields
struct Layer2 {
    b1:Bool;
    b2:Bool?;
    s1:String;
    s2:String?;
    i1:Int;
    i2:Int?;
}

struct Layer1 {
    l2a:Layer2;
    l2b:Layer2;
}

contract HugeNestedPersist {
    l1:Layer1;

    init() {
        self.l1 = Layer1{
            l2a: Layer2{ b1:true,b2:false,s1:"x",s2:null,i1:77,i2:88 },
            l2b: Layer2{ b1:false,b2:true,s1:"abc",s2:"def",i1:11,i2:null }
        };
    }
}