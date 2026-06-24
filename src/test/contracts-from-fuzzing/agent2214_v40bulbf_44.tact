struct X { a: Int; }
struct Y { b: X?; }
struct Z { c: Y?; }

contract ChainOptionals {
    val: Z;

    init() {
        self.val = Z{ c: null };
    }
}