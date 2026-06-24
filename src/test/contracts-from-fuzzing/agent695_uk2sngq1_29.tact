struct Container {
    v1: Int;
    v2: Bool;
    v3: String;
}

contract ContractArrayStyle {
    c1: Container;
    c2: Container;
    c3: Container;
    c4: Container;

    init() {
        self.c1 = Container{v1:1,v2:true,v3:"a"};
        self.c2 = Container{v1:2,v2:false,v3:"b"};
        self.c3 = Container{v1:3,v2:true,v3:"c"};
        self.c4 = Container{v1:4,v2:false,v3:"d"};
    }
}