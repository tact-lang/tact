// Very deep nested and wide contract state stress test (no maps)
struct L4 { a:Int; b:Bool; c:String; }
struct L3 { l4:L4; o:Bool?; s:String; }
struct L2 { l3:L3; b2:Bool; s2:String?; }
struct L1 { l2:L2; b1:Bool; s1:String; }

contract DeepWideStorage {
    nested: L1;
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
    plain1: Int;
    plain2: Bool;

    init() {
        self.nested = L1{
            l2: L2{
                l3: L3{
                   l4: L4{a:5,b:true,c:"hello"},
                   o: false,
                   s: "level3"
                },
                b2: true,
                s2: null
            },
            b1: false,
            s1: "level1"
        };
        self.opt1 = null;
        self.opt2 = "data";
        self.opt3 = true;
        self.plain1 = 7;
        self.plain2 = false;
    }
}
