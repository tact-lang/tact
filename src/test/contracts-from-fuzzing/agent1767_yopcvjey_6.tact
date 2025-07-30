struct Inner { a: Int; }

struct Middle {
    x: Inner?;
}

struct OuterOption {
    y: Middle?;
}

contract NestedOptionals {
    state: OuterOption;

    init() {
        self.state = OuterOption {
            y: Middle {
                x: Inner { a: 7 }
            }
        };
    }
}
