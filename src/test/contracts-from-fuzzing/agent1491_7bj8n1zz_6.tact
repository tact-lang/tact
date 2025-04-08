struct Child { val: Int }

struct Container {
    first: Child?;
    second: Child?;
}

contract TestContract {
    data: Container;
    init() {
        self.data = Container{
            first: null,
            second: Child{ val: 99 }
        };
    }
}