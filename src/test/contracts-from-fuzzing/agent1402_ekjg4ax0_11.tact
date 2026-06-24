struct LargeNested {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    s1: OptionalContainer;
    s2: OptionalContainer;
    s3: OptionalContainer;
}

contract LargeNestedTest {
    info: LargeNested;

    init() {
        self.info = LargeNested{
            a:1, b:2, c:3, d:4, e:5,
            s1: OptionalContainer{a:null,b:true,c:null,d:null,e:null},
            s2: OptionalContainer{a:42,b:null,c:"hi",d:null,e:null},
            s3: OptionalContainer{a:null,b:false,c:"w",d:null,e:null}
        };
    }
}

struct OptionalContainer {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}