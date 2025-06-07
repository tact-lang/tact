struct Inline {
    a: Int;
    b: Bool;
}

contract Structured {
    x: Int;
    y: Inline;
    z: String;

    init() {
        self.x = 5;
        self.y = Inline{ a:1, b:true };
        self.z = "done";
    }
}