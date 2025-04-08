struct Nest1 {
    val: Int;
}

struct Nest2 {
    inner: Nest1;
}

struct Nest3 {
    inner: Nest2;
}

contract DeepChain {
    chain: Nest3;

    init() {
        self.chain = Nest3{inner: Nest2{inner: Nest1{val:99}}};
    }
}