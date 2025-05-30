struct Data {
    a: Int;
    b: Bool;
    c: String;
}

contract DuplicatedStructs {
    d1: Data;
    d2: Data;

    init() {
        self.d1 = Data{a:1,b:true,c:"hi"};
        self.d2 = Data{a:2,b:false,c:"yo"};
    }
}
