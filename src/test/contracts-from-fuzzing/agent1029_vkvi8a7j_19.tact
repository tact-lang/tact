struct MultiNested {
    sub1: SubStruct1;
    sub2: SubStruct2;
}

struct SubStruct1 {
    a: Int;
    b: Bool;
}

struct SubStruct2 {
    x: Int?;
    y: String;
    z: Bool?;
}

contract MultiNestedContract {
    big: MultiNested;
    init() {
        self.big = MultiNested{
            sub1: SubStruct1{a:1,b:true},
            sub2: SubStruct2{x:null,y:"yo",z:null}
        };
    }
}