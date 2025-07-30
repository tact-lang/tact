struct Lvl3 { q:Int; r:Bool; }
struct Lvl2 { val:Int?; child:Lvl3; }
struct Lvl1 { inner:Lvl2; name:String; flag:Bool?; }

contract Comb {
    f: Lvl1;
    init() {
        self.f=Lvl1{inner:Lvl2{val:null,child:Lvl3{q:5,r:false}},name:"nm",flag:true};
    }
}