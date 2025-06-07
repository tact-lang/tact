struct NestOpt {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

struct Container {
    inner: NestOpt;
    val: Int;
}

contract OptionalNestTest {
    st: Container;
    init() {
        self.st = Container{
            inner: NestOpt{f1:null, f2:true, f3:"s"},
            val:10
        };
    }
}