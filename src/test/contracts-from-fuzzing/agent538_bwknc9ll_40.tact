struct ManyNestedOptionals {
    l1: Int?;
    l2: Int?;
    l3: Int?;
    l4: Int?;
    l5: Int?;
    l6: Int?;
    l7: Int?;
    l8: Int?;
 }

contract HeavyOptStruct {
    nested: ManyNestedOptionals;

    init() {
        self.nested = ManyNestedOptionals{
            l1:null,l2:null,l3:null,l4:null,l5:null,l6:null,l7:null,l8:null
        };
    }
}