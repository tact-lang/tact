struct Layer3 {
    m: Int?;
    n: String?;
}

struct Layer2 {
    a: Layer3?;
    b: Bool?;
}

struct Layer1 {
    x: Int;
    y: Layer2?;
    z: String?;
}

contract MegaOpt {
    root: Layer1;

    init() {
        self.root = Layer1{
            x: 777,
            y: Layer2{
                a: null,
                b: true
            },
            z: null
        };
    }

    receive() {
        if (self.root.y != null) {
            let _ = self.root.y!!.b;
        }
    }
}