// declare alias to test
struct AliasTest {
    x: Int;
}

contract AliasDemo {
    f: AliasTest;

    init() {
        self.f = AliasTest{
            x: 7
        };
    }
}