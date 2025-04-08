struct D {
    x: Int;
    y: Bool;
    s: String;
}

contract DefaultsWithInits {
    d: D = D{ x:0,y:false,s:"" };

    init() {
        self.d = D{ x:42, y:true, s:"hi" };
    }
}
