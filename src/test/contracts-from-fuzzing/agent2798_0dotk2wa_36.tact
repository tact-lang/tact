struct Recursive1 {
    next: Recursive2?;
}

struct Recursive2 {
    value: Int;
}

contract RecursiveOptContract {
    data: Recursive1;

    init() {
        self.data = Recursive1{
            next: Recursive2{
                value: 777
            }
        };
    }
}