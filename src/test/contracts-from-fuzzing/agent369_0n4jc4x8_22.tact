struct Layer1 {
    a: Int;
    b: Int?;
}

struct Layer2 {
    x: Layer1;
    y: Layer1?;
}

struct Layer3 {
    foo: Layer2;
    bar: Layer2?;
}

contract MixedDeepNestTest {
    val: Layer3;

    init() {
        self.val = Layer3{
            foo: Layer2{
                x: Layer1{a:1,b:null},
                y: null,
            },
            bar: Layer2{
                x: Layer1{a:3,b:null},
                y: null,
            },
        };
    }
}