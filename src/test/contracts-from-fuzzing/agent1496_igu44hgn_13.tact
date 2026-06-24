struct A1 {
    x: Int;
}

struct A2 {
    x: Int?;
}

struct A3 {
    x: Bool;
}

struct A4 {
    x: Bool?;
}

struct Container {
    a1: A1;
    a2: A2;
    a3: A3;
    a4: A4;
}

contract TestContract {
    data: Container;
    init() {
        self.data = Container{
            a1: A1{ x: 1 },
            a2: A2{ x: null },
            a3: A3{ x:true },
            a4: A4{ x:false }
        };
    }
}