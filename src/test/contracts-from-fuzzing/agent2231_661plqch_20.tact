struct LargeNestedInit {
    a: Int;
    b: InnerLarge;
}

struct InnerLarge {
    x: Int;
    y: Int;
    z: Int;
    flag: Bool;
}

contract LargeNestedContract {
    data: LargeNestedInit;

    init() {
        self.data = LargeNestedInit{
            a: 1,
            b: InnerLarge{
                x:2,y:3,z:4,flag:true
            }
        };
    }
}