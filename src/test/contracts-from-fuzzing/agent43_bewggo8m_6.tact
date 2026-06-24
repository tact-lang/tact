struct InnerOpt {
    flag: Bool?;
}

struct Container {
    maybeInner: InnerOpt?;
    text: String;
}

contract TestContract {
    container: Container;

    init() {
        self.container = Container{
            maybeInner: null,
            text: "opt inside"
        };
    }
}