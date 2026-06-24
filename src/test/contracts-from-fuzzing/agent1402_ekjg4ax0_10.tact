struct OptionalContainer {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

struct MultiNested {
    nested1: OptionalContainer;
    nested2: OptionalContainer;
    nested3: OptionalContainer;
}

contract OptMix {
    value: MultiNested;

    init() {
        self.value = MultiNested{
            nested1: OptionalContainer{a:1,b:true,c:"x",d:null,e:null},
            nested2: OptionalContainer{a:null,b:null,c:null,d:null,e:null},
            nested3: OptionalContainer{a:5,b:false,c:"q",d:null,e:null}
        };
    }
}