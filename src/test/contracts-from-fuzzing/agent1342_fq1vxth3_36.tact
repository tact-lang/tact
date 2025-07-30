// optional nested in default
struct InnerOpt {
    val: Int?;
}

struct Container {
    inner: InnerOpt?;
    flag: Bool;
}

contract NestingOpt {
    data: Container;

    init() {
        self.data = Container{
            inner: InnerOpt{
                val: null
            },
            flag: true
        };
    }
}