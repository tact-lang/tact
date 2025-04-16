struct ManyLayer1{ x:Int; }
struct ManyLayer2{ l1:ManyLayer1; }
struct ManyLayer3{ l2:ManyLayer2; }
struct ManyLayer4{ l3:ManyLayer3; }
struct ManyLayer5{ l4:ManyLayer4; }
contract ManyLayers {
    val:ManyLayer5;
    init(){
        self.val=ManyLayer5{l4:ManyLayer4{l3:ManyLayer3{l2:ManyLayer2{l1:ManyLayer1{x:1}}}}};
    }
}