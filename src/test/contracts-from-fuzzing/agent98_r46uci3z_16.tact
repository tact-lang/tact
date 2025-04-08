struct InheritanceTest {
    flag: Bool;
    val: Int;
}

struct Wrapper {
    embed: InheritanceTest;
    active: Bool;
}

contract NestedInheritanceStorage {
    storage: Wrapper;

    init() {
        self.storage = Wrapper{
            embed: InheritanceTest{
                flag: true,
                val: 100,
            },
            active: false,
        };
    }
}