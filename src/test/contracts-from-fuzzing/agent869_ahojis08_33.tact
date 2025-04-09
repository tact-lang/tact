struct PPC {
    x: Int; y: Int; z: Int;
}
contract Comb1(
    foo: PPC,
    bar: Int
) {}

contract Comb2 {
    foo: PPC;
    bar: Int;

    init() {
        self.foo = PPC{x:1,y:2,z:3};
        self.bar = 4;
    }
}