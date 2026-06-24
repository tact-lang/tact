struct Nest1 {
    f1: Int;
    f2: Bool;
}

struct Nest2 {
    inner: Nest1;
    other: Int;
}

struct Nest3 {
    inner: Nest2;
    val: Bool;
}

contract NestChain {
    data: Nest3;
    init() {
        self.data = Nest3{
            inner: Nest2{
                inner: Nest1{ f1:7, f2:true },
                other: 33
            },
            val: false
        };
    }
}