struct OneLayer {
    x: Int;
    y: Bool;
    z: String;
    t: Address;
}

struct TwoLayers {
    inner: OneLayer;
}

contract OuterMost {
    state: TwoLayers = TwoLayers{
        inner: OneLayer{
            x:0,y:true,z:"hello",t:address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c")
        }
    };

    init() {}
}
