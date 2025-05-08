struct S { a: Int; b: Bool; c: String; }

contract NestedMany {
    x1:S; x2:S; x3:S; x4:S;

    init() {
        self.x1 = S{a:1,b:true,c:"a"};
        self.x2 = S{a:2,b:false,c:"b"};
        self.x3 = S{a:3,b:true,c:"c"};
        self.x4 = S{a:4,b:false,c:"d"};
    }
}
