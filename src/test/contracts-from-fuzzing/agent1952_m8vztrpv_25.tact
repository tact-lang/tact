struct Inheritance1 {
    value: Int;
}

struct Inheritance2 {
    nested: Inheritance1;
}

struct Inheritance3 {
    nested: Inheritance2;
}

contract TestContract {
    data: Inheritance3;

    init() {
        self.data = Inheritance3{
            nested: Inheritance2{
                nested: Inheritance1{
                    value: 777,
                },
            },
        };
    }
}
