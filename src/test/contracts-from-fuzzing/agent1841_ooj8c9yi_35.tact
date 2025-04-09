// Now test optional struct references alongside nested opt fields

struct InnerLevel {
    n: Int?;
}

struct Container {
    child: InnerLevel?;
    flag: Bool;
}

contract RefNestedOpt {
    data: Container?;

    init() {
        self.data = Container{
            child: InnerLevel{n:5},
            flag: true
        };
    }
}
