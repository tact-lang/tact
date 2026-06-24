struct Outer {
    one: Layer;
    two: Layer;
    three: Layer;
}

struct Layer {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
}

contract TestContract {
    storage: Outer;
    init() {
        self.storage = Outer{
            one: Layer{i:1,b:true,s:"a",o:1},
            two: Layer{i:2,b:false,s:"b",o:null},
            three: Layer{i:3,b:true,s:"c",o:3}
        };
    }
}