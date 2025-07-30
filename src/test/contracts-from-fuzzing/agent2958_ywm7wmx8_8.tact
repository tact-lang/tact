struct Crazy {
    a: Int; 
    b: Bool?; 
    c: String; 
    d: Address?; 
    e: Cell; 
    f: Slice; 
    g: Builder;
}

contract Test {
    x: Crazy;
    y: Crazy;
    z: Crazy;
    
    init() {
        self.x = Crazy{ a:1, b:true, c:"x", d:null, e:emptyCell(), f:emptyCell().asSlice(), g:beginCell() };
        self.y = Crazy{ a:2, b:null, c:"y", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice(), g:beginCell() };
        self.z = Crazy{ a:3, b:false, c:"z", d:null, e:emptyCell(), f:emptyCell().asSlice(), g:beginCell() };
    }
}