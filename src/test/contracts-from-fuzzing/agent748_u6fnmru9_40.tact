// Multiple nested structs with different serialization sizes
struct Skinny {
    a: Int as int8;
    b: Bool;
}

struct Fatter {
    x: Skinny;
    y: Skinny;
}

struct Fat {
    inner: Fatter;
    big: Int as int256;
}

contract SerializationMix {
    state: Fat;

    init() {
        self.state = Fat{
            inner: Fatter{
                x:Skinny{a:1,b:true},
                y:Skinny{a:-1,b:false}
            },
            big: 1000000
        };
    }
}