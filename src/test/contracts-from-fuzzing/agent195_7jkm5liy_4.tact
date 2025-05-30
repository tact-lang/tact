struct Nested {
    x: Int;
    y: Bool;
    z: String?;
}

contract Storage {
    n1: Nested;
    n2: Nested;
    flag: Bool; 
    text: String;
    opti: Int?;

    init() {
        self.n1 = Nested{ x: 3, y: false, z: null };
        self.n2 = Nested{ x: 4, y: true, z: "opt" };
        self.flag = true;
        self.text = "test";
        self.opti = null;
    }
}
