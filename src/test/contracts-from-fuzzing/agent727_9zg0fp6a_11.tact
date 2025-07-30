struct Layer3 {
    a: Int;
    b: Bool?;
}

struct Layer2 {
    l3: Layer3?;
    x: Int;
}

struct Layer1 {
    l2: Layer2;
    y: Bool;
}

contract MixedDeepOptionals {
    root: Layer1;

    init() {
        self.root = Layer1{
            l2: Layer2{
                l3: Layer3{
                    a: 1,
                    b: null
                },
                x: 9
            },
            y: true
        };
    }
}