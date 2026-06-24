struct Large1 { a: Int; b: Bool; c: String; d: Address; }
struct Large2 { e: Int; f: Bool; g: String; h: Address; }

struct BigNestedStruct {
    s1: Large1;
    s2: Large2;
}

contract MixedBig {
    data: BigNestedStruct;

    init() {
        self.data = BigNestedStruct{
            s1: Large1{ a:1,b:true,c:"A",d:myAddress() },
            s2: Large2{ e:2,f:false,g:"B",h:myAddress() }
        };
    }
}