struct DeepOption {
    x: Int?;
    y: Bool?;
}

struct Container {
    inner: DeepOption?;
    val: Int;
}

contract OptContainer {
    state: Container;

    init() {
        self.state = Container{
            inner: null,
            val: 777,
        };
    }
}