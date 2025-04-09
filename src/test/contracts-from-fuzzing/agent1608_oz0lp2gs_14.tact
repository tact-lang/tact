struct Complex {
    x: Int;
    y: Bool;
    z: String;
}

struct Container {
    first: Complex;
    second: Complex;
}

contract NestedTwice {
    val: Container = Container{
        first: Complex{ x:1,y:false,z:"a" },
        second: Complex{ x:2,y:true,z:"b" }
    };

    init() {
        self.val = Container{
            first: Complex{ x:10,y:true,z:"AA" },
            second: Complex{ x:20,y:false,z:"BB" }
        };
    }
}