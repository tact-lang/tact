struct Data {
    x: Int;
    y: Bool;
    s: String;
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract TestContract {
    d1: Data;
    d2: Data;
    d3: Data;
    d4: Data;

    init() {
        self.d1 = Data{ x:1, y:true, s:"a", o1:null, o2:null, o3:null };
        self.d2 = Data{ x:2, y:false, s:"b", o1:3, o2:true, o3:"c" };
        self.d3 = Data{ x:3, y:true, s:"d", o1:4, o2:false, o3:"e" };
        self.d4 = Data{ x:4, y:false, s:"f", o1:null, o2:true, o3:null };
    }
}