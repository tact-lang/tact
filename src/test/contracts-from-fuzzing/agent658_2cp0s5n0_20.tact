struct Trio {
    a: Int;
    b: Bool;
    c: String;
}

struct Container {
    first: Trio;
    second: Trio;
    third: Trio;
}

contract Triplicate {
    field: Container;

    init() {
        self.field = Container{
            first: Trio{a:1,b:true,c:"x"},
            second: Trio{a:2,b:false,c:"y"},
            third: Trio{a:3,b:true,c:"z"}
        };
    }
}