struct Nest {
    a: Int;
    b: Int?;
}

contract DFT {
    n: Nest;
    x: Int;
    y: Int?;

    init(){
        self.n = Nest{a:1,b:null};
        self.x = 2;
        self.y = null;
    }
}