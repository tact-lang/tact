struct DeepNested {
    n1: Int;
    n2: Int?;
    n3: String;
    n4: Bool?;
    n5: Address;
    n6: Cell?;
    n7: Slice?;
    n8: Builder?;
    n9: String?;
    n10: Int;
    n11: Bool;
    n12: Address;
    n13: Int?;
    n14: Bool?;
    n15: String?;
}

struct Wrapper {
    nested: DeepNested;
    more: DeepNested;
}

contract Test {
    d: Wrapper;

    init() {
        self.d = Wrapper{
            nested: DeepNested{
                n1:1, n2:null, n3:"a", n4:null, n5:myAddress(), n6:null, n7:null, n8:null, n9:null,
                n10:2, n11:true, n12:myAddress(), n13:null, n14:null, n15:null
            },
            more: DeepNested{
                n1:3, n2:null, n3:"b", n4:null, n5:myAddress(), n6:null, n7:null, n8:null, n9:null,
                n10:4, n11:false, n12:myAddress(), n13:null, n14:null, n15:null
            }
        };
    }
}