struct InnerMass {
    n1: Int; n2: Int; n3: Int; n4: Int; n5: Int;
    n6: Int; n7: Int; n8: Int; n9: Int; n10: Int;
}

struct OuterMass {
    a: InnerMass;
    b: InnerMass;
}

contract MassTest {
    data: OuterMass;

    init() {
        self.data = OuterMass{
            a: InnerMass{
                n1:1,n2:2,n3:3,n4:4,n5:5,n6:6,n7:7,n8:8,n9:9,n10:10
            },
            b: InnerMass{
                n1:11,n2:12,n3:13,n4:14,n5:15,n6:16,n7:17,n8:18,n9:19,n10:20
            }
        };
    }
}