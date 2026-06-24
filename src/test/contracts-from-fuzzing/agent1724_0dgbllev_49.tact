struct Mixed1 { a:Int; b:Bool; }
struct Mixed2 { a:Int?; b:Bool?; }

contract TwoStructs {
    x: Mixed1;
    y: Mixed2;
    init() {
        self.x = Mixed1{a:1,b:false};
        self.y = Mixed2{a:null,b:null};
    }
}