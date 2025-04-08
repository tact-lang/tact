struct Many {
    a: Int; b: Bool; c: Address; d: String;
    e: Int?; f: Bool?; g: Address?; h: String?;
}

contract TestContract {
    m: Many;

    init() {
        self.m = Many {
            a:1, b:true, c:myAddress(), d:"d",
            e:null, f:null, g:null, h:null,
        };
    }

    receive(){ dump(self.m.a); }
}