struct AltOptional {
    x: Int?;
    y: Bool?;
}

struct Container {
    content: AltOptional?;
}

contract OptContainer {
    val: Container;

    init() {
        self.val = Container{
            content: null
        };
    }
}