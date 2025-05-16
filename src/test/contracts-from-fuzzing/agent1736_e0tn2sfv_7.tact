struct Desc {
    description: String;
    active: Bool;
    amount: Int; 
}

struct Container {
    first: Desc;
    second: Desc;
}

contract MultiStructPersistent {
    container: Container;
    init() {
        self.container = Container{
            first: Desc{
                description: "First",
                active: true,
                amount: 10
            },
            second: Desc{
                description: "Second",
                active: false,
                amount: 20
            }
        };
    }
}