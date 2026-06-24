struct Layer3 { val: Int; }
struct Layer2 { mid: Layer3; flag: Bool; }
struct Layer1 { top: Layer2; s: String; }

contract Layered {
    nested: Layer1;
    init() {
        self.nested = Layer1{
            s: "hello",
            top: Layer2{
                mid: Layer3{val:42},
                flag:true
            }
        };
    }
}