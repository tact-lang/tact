struct Sub1 { a:Int; b:Bool; }
struct Sub2 { s:String; opt:Int?; }

struct Container {
    s1: Sub1;
    s2: Sub2;
    flag: Bool;
    text: String;
}

contract StructsInStructs {
    val: Container;

    init() {
        self.val = Container{
            s1: Sub1{a:5, b:true},
            s2: Sub2{s:"zzz", opt:null},
            flag: false,
            text: "t"
        };
    }
}
