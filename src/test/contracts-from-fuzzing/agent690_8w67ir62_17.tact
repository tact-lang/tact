struct Simple {
    a: Int;
}

struct Holder {
    inner: Simple;
}

struct Container {
    innerHolder: Holder;
}

contract DeepChain {
    root: Container;

    init() {
        self.root = Container{
            innerHolder: Holder{
                inner: Simple{a:7}
            }
        };
    }
}