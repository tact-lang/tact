struct Arrange1 {
    v1: Int; v2: Bool; v3: String;
}

struct Arrange2 {
    s: Arrange1; flag: Bool; 
}

contract TestContract {
    a1: Arrange1;
    a2: Arrange2;

    init() {
        self.a1 = Arrange1{v1:1, v2:true, v3:"x"};
        self.a2 = Arrange2{s: Arrange1{v1:7, v2:false, v3:"y"}, flag: false};
    }
    
    receive() {}
}