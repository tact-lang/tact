struct Mix {
    x: Int;
    y: Bool?;
    z: String;
}

contract WithMixed {
    val: Mix?;

    init() {
        self.val = Mix{x: 7, y:true, z:"ok"};
    }
}