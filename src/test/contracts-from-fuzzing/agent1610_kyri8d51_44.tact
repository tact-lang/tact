struct OuterStruct {
    inner1: Inner1;
    inner2: Inner2;
}
struct Inner1 {
    a: Int;
    b: Bool?;
}
struct Inner2 {
    s: String?;
    t: Int;
}
contract MixedNestedOptional {
    data: OuterStruct;
    init() {
        self.data=OuterStruct{
            inner1:Inner1{a:5,b:null},
            inner2:Inner2{s:null,t:10}
        };
    }
}