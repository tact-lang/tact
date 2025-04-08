struct BigNest {
    sub1: Int;
    sub2: Int;
    sub3: Int;
    sub4: Int;
    sub5: Int;
    sub6: Int;
    sub7: Int;
    sub8: Int;
    sub9: Int;
    sub10: Int;
}

struct Outer {
    nested: BigNest;
    flag: Bool;
    note: String;
}

contract StructOfBigNest {
    content: Outer = Outer{
        nested: BigNest{
            sub1:1,sub2:2,sub3:3,sub4:4,sub5:5,sub6:6,sub7:7,sub8:8,sub9:9,sub10:10
        },
        flag:true,
        note:"hi"
    };

    init() {
        self.content = Outer{
            nested: BigNest{
                sub1:11,sub2:12,sub3:13,sub4:14,sub5:15,sub6:16,sub7:17,sub8:18,sub9:19,sub10:20
            },
            flag:false,
            note:"hello"
        };
    }
}