struct Combo {
    x: Int;
    y: Int?;
    z: Bool;
    s: String?;
}

contract TestContract {
    field: Combo;

    init() {
        self.field = Combo{x:10, y:null, z:true, s:null};
    }
}
