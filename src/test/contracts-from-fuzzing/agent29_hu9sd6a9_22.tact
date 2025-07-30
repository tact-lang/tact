struct Reordered {
    x: Int;
    y: Bool;
    z: String;
}

contract FirstOrder {
    data: Reordered;
    init() {
        self.data = Reordered{ x:1, y:true, z:"ok" };
    }
}

contract SecondOrder {
    data: Reordered;
    init() {
        self.data = Reordered{ y:true, z:"ok", x:1 };
    }
}