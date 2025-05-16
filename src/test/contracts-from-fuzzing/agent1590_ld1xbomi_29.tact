struct InnerS {
    a:Int;
    b:Int;
    c:Int;
    d:Int;
    e:Int;
}
struct OuterS {
    f: InnerS;
    g: InnerS;
    h: InnerS;
}
contract RepeatedNestedStructs {
    val: OuterS;

    init() {
        self.val = OuterS {
            f: InnerS{a:1,b:2,c:3,d:4,e:5},
            g: InnerS{a:6,b:7,c:8,d:9,e:10},
            h: InnerS{a:11,b:12,c:13,d:14,e:15}
        };
    }
}