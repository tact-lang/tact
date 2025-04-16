struct Compose {
    a: Int;
    b: Bool;
}

contract MultiCompose {
    x: Compose;
    y: Compose;
    z: Compose;

    init() {
        self.x = Compose{a:1,b:true};
        self.y = Compose{a:2,b:false};
        self.z = Compose{a:3,b:true};
    }
}