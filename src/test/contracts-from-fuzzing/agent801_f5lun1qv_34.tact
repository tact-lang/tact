struct SimpleEmbed {
    x: Int;
}

contract DefaultedEmbed {
    foo: SimpleEmbed = SimpleEmbed{ x: 42 };

    init() {
        self.foo = SimpleEmbed{ x: 99 };
    }
}