struct Inner{
    x:Int;
}

struct Mid{
    y:Inner;
}

struct Outer{
    z:Mid;
}

contract NestedStructsChain {
    data:Outer;

    init() {
        self.data=Outer{
            z:Mid{
                y:Inner{ x:123 }
            }
        };
    }
}