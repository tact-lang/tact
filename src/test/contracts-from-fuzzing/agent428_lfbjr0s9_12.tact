// Several nested structs with optionals inside contract
struct Sub {
    foo: Int?;
    bar: Bool?;
}

struct Container {
    sub1: Sub?;
    sub2: Sub?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            sub1: null,
            sub2: Sub { foo: 10, bar: null },
        };
    }
}