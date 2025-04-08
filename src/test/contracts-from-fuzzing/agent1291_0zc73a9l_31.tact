struct Dummy {
    x: Int;
    y: Int;
}

contract ManyDummies {
    d0: Dummy;
    d1: Dummy;
    d2: Dummy;
    d3: Dummy;
    d4: Dummy;

    init() {
        self.d0=Dummy{x:0,y:0};
        self.d1=Dummy{x:1,y:1};
        self.d2=Dummy{x:2,y:2};
        self.d3=Dummy{x:3,y:3};
        self.d4=Dummy{x:4,y:4};
    }
}