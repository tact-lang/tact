// Contract with primitive, optionals, composite using all types except maps
struct Bundle {
    amt: Int;
    label: String;
    yes: Bool;
    memo: String?;
    count: Int?;
}

contract FullRange {
    x:Int;
    y:String;
    z:Bool;
    o1:Int?;
    o2:String?;
    o3:Bool?;
    g:Bundle;

    init() {
        self.x=42;
        self.y="hi";
        self.z=true;
        self.o1=null;
        self.o2=null;
        self.o3=null;
        self.g=Bundle{
            amt:1,
            label:"b",
            yes:false,
            memo:null,
            count:null
        };
    }
}