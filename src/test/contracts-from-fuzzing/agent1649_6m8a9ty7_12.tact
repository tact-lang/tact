struct Deep {
    s: String?; 
    n: Int?;
}

struct Container {
    flag: Bool;
    val: Deep?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            flag: true,
            val: Deep{
                s: null,
                n: null,
            },
        };
    }
}