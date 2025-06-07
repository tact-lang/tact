struct Nested1 {
    a:Int; b:Bool;
}

struct Nested2 {
    c:Int?; d:String;
}

contract ABC {
    n1: Nested1;
    n2: Nested2;
    flag: Bool;

    init() {
        self.n1 = Nested1{a:7,b:false};
        self.n2 = Nested2{c:null,d:"s"};
        self.flag=true;
    }
}