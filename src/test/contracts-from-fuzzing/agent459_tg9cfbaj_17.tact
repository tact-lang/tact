struct Plain {
    x: Int;
    y: Bool;
}

message(10) Info {
    z: String;
}

struct Mix {
    a: Plain;
    b: Info;
}

contract MixedNestedKinds {
    data: Mix = Mix{
        a: Plain{ x:1, y:true },
        b: Info{ z:"abc" }
    };

    init() {
        self.data = Mix{
            a: Plain{ x:2,y:false },
            b: Info{ z:"def" }
        };
    }
}