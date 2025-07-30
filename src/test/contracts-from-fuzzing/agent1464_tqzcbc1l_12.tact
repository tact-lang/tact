struct Container {
    val: Int;
    nested: Inner;
}

struct Inner {
    optionalVal: Int?;
    flag: Bool;
}

contract TestContract {
    c: Container;

    init() {
        self.c = Container{
            val: 99,
            nested: Inner{
                optionalVal:null,
                flag: true
            }
        };
    }
}