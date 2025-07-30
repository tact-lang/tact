// Contract with a struct that contains nested optional and defaulted primitive fields
struct Inner {
    foo: Int? = null;
    bar: Bool? = true;
    text: String? = null;
}

struct Container {
    inner: Inner;
    num: Int;
}

contract ContainOptDefault {
    st: Container;

    init() {
        self.st = Container{
            inner: Inner{},
            num: 55
        };
    }
}