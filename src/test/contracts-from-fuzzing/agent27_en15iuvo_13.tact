struct Compose {
    a: Int;
    b: Bool?;
    c: String;
}

contract MultiAssign {
    x: Compose;
    y: Compose;

    init() {
        self.x = Compose{ a:1, b:null, c:"X" };
        self.y = Compose{ a:2, b:true, c:"Y" };
    }
}