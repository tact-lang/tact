struct Container {
    first: Int;
    second: Bool;
    third: String;
}

contract TestContract {
    c1: Container;
    c2: Container;
    init() {
        self.c1 = Container{ first:1, second:true, third:"x" };
        self.c2 = Container{ first:2, second:false, third:"y" };
    }
}