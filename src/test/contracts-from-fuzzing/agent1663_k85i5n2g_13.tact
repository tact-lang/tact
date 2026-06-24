struct Mix {
    a: Int;
    b: Bool?;
    c: Int?;
    d: Bool;
}

contract OptionalMix {
    data: Mix?;
    init() {
        self.data = Mix{a:5,b:null,c:null,d:true};
    }
}