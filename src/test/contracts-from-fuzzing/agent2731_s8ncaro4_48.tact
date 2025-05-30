struct Lvl2 {
    foo: Int;
    bar: String;
}

struct Lvl1 {
    inner: Lvl2;
    flag: Bool;
}

contract NestedMixTest {
    val: Lvl1;

    init() {
        self.val = Lvl1{
            inner: Lvl2{foo:1, bar:"a"},
            flag: true
        };
    }
}