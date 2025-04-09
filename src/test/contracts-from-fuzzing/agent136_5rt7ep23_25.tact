struct Compose {
    a: Int;
    b: Bool;
    c: String;
}

contract StructArr {
    one: Compose;
    two: Compose;

    init() {
        self.one = Compose{ a:1, b:true, c:"hi" };
        self.two = Compose{ a:2, b:false, c:"yo" };
    }
}