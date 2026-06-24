struct Deep {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
}

struct Middle {
    one: Deep;
    two: Deep;
}

struct TopLevel {
    left: Middle;
    right: Middle;
}

contract TestContract {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            left: Middle{
                one: Deep{a:1,b:true,c:null,d:null},
                two: Deep{a:2,b:false,c:null,d:null},
            },
            right: Middle{
                one: Deep{a:3,b:true,c:null,d:null},
                two: Deep{a:4,b:false,c:null,d:null},
            }
        };
    }
}
