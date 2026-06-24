struct InnerMostStruct {
    m: Int;
}

struct InnerStruct {
    innerMost: InnerMostStruct;
    b: Int;
}

struct MidStruct {
    innerStruct: InnerStruct;
    c: Int;
}

struct OuterStruct {
    mid: MidStruct;
    a: Int;
}

contract NestedDeepTest {
    state: OuterStruct;

    init() {
        self.state = OuterStruct{
            mid: MidStruct{
                innerStruct: InnerStruct{
                    innerMost: InnerMostStruct{m:42},
                    b:43
                },
                c:44
            },
            a:45
        };
    }
}