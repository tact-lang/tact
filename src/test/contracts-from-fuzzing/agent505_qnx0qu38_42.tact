struct Mid {
    a: Int;
    b: Bool?;
}

contract MidOpt {
    mid: Mid = Mid{ a:3, b:null };
    x: Int = 5;

    init() {
        self.mid = self.mid;
    }

    receive() {
        self.x = self.x;
    }
}