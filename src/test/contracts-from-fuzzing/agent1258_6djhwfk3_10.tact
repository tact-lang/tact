// optional struct type itself
struct Child {
    text: String;
}

struct Parent {
    child: Child?;
}

contract OptionalStructFieldDirect {
    data: Parent;

    init() {
        self.data = Parent{
            child: null,
        };
    }

    receive() {
        if (self.data.child == null) {
            self.data = Parent{
                child: Child{
                    text: "hello",
                },
            };
        }
    }
}