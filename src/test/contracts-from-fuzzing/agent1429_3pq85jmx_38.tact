struct Optionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptDefault {
    val: Optionals = Optionals{ x:null, y:null, z:null };

    init() {
        self.val = Optionals{ x:1, y:true, z:"q" };
    }
}