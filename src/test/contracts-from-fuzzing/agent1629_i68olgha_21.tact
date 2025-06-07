struct InnerA {
    a:Int;
    b:Bool;
    c:String;
}

struct InnerB {
    d:Int?;
    e:Bool?;
    f:String?;
}

struct OuterBoth {
    x:InnerA;
    y:InnerB;
}

contract NestedMixedOpts {
    val: OuterBoth;

    init() {
        self.val = OuterBoth{
            x: InnerA{
                a: 1,
                b: true,
                c: "A",
            },
            y: InnerB{
                d: null,
                e: false,
                f: null,
            }
        };
    }
}