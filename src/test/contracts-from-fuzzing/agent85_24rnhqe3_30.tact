struct Mix {
    x: Int;
    y: Bool?;
    z: String;
}

struct Wrap {
    m: Mix;
    o: Mix?;
}

contract MixOpt {
    val: Wrap;
    init() {
        self.val = Wrap{
            m: Mix{ x:1, y:true, z:"a" },
            o: null
        };
    }
}