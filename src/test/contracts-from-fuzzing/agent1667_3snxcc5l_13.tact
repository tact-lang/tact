struct Layer3 { v: Int }
struct Layer2 { n2: Layer3 }
struct Layer1 { n1: Layer2 }

contract TestContract {
    x: Layer1;
    y: Layer1;
    z: Layer1;

    init() {
        self.x = Layer1{n1:Layer2{n2:Layer3{v:10}}};
        self.y = Layer1{n1:Layer2{n2:Layer3{v:20}}};
        self.z = Layer1{n1:Layer2{n2:Layer3{v:30}}};
    }
}