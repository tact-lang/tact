struct Chain1 {
    next: Chain2;
    val: Int;
}

struct Chain2 {
    next: Chain3;
    txt: String;
}

struct Chain3 {
    opt: Int?;
    b: Bool;
}

contract ChainStore {
    data: Chain1;

    init() {
        self.data = Chain1{
            next: Chain2{
                next: Chain3{ opt: null, b: true },
                txt: "hi"
            },
            val: 1
        };
    }
}