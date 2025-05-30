struct DeepNesting1 { x:Int; }
struct DeepNesting2 { d1:DeepNesting1; }
struct DeepNesting3 { d2:DeepNesting2; }
struct DeepNesting4 { d3:DeepNesting3; }
struct DeepNesting5 { d4:DeepNesting4; }

contract DeepChain {
    val: DeepNesting5;
    init() {
        self.val = DeepNesting5{d4:DeepNesting4{d3:DeepNesting3{d2:DeepNesting2{d1:DeepNesting1{x:42}}}}};
    }
}