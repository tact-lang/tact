struct MultiLayer{
    s1: Layer1;
}

struct Layer1{
    s2: Layer2;
    b: Bool;
}

struct Layer2{
    s3: Layer3;
}

struct Layer3{
    val: Int;
    str: String;
}

contract ManyLayersContract {
    val: MultiLayer;
    init() {
        self.val = MultiLayer{
            s1: Layer1{
                s2: Layer2{
                    s3: Layer3{ val: 77, str: "deep" }
                },
                b: true
            }
        };
    }
}