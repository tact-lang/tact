struct Leaves { a:Int; b:Int; }
struct Branches { l:Leaves; r:Leaves; }
struct MainTree { left:Branches; right:Branches; flag:Bool; }

contract TreeTest {
    t: MainTree;

    init() {
        self.t = MainTree{
            left: Branches{ l:Leaves{a:1,b:2}, r:Leaves{a:3,b:4} },
            right: Branches{ l:Leaves{a:5,b:6}, r:Leaves{a:7,b:8} },
            flag: true
        };
    }
}
