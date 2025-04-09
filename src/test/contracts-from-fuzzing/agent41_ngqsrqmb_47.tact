// Large nested optional tree with serialization annotations
struct L3 { v:Int as uint32; } 
struct L2 { opt: L3?; flag:Bool; }
struct L1 { wrap:L2?; s:String; }

contract LargeOptTree {
    data: L1;
    init() {
        self.data = L1{
            wrap: null,
            s:"test"
        };
    }
}