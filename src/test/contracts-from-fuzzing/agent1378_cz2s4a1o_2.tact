struct Nested {
    x: Int;
    y: Bool;
    z: Address;
}

contract Test {
    n: Nested = Nested{x:1,y:true,z: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c")};
    init() {
        self.n = Nested{x:2,y:false,z:address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c")};
    }
    receive() {}
}