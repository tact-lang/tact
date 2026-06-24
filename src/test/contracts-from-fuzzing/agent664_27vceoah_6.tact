struct Layer1 {
    a: Int;
    b: Bool?;
}

struct Layer2 {
    x: Layer1?;
    y: String;
}

struct Layer3 {
    nested: Layer2;
    s: String?;
}

contract MixContract {
    data: Layer3;

    init() {
        self.data = Layer3{
            nested: Layer2{
                x: Layer1{a:1,b:true},
                y:"yo"
            },
            s: null
        };
    }
}
