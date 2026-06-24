struct Inner {
    i: Int;
    b: Bool;
    t: String;
    o: Int?;
}

contract BigStore {
    one: Inner;
    two: Inner;
    three: Inner;

    init() {
        self.one = Inner{i:1,b:true,t:"a",o:null};
        self.two = Inner{i:2,b:false,t:"b",o:null};
        self.three = Inner{i:3,b:true,t:"c",o:null};
    }
}