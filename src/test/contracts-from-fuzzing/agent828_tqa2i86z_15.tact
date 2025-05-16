struct Inner {
    bigText: String;
}

struct Outer {
    id: Int;
    detail: Inner;
}

contract TestContract {
    stuff: Outer;

    init() {
        self.stuff = Outer{
            id: 1,
            detail: Inner{
                bigText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"
            }
        };
    }
}