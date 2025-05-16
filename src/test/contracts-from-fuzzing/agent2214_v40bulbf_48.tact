struct Info {
    a: Int;
    b: Bool;
    c: String;
}

struct Container {
    first: Info;
    second: Info;
    third: Info;
}

contract WideContainer {
    val: Container;

    init() {
        self.val = Container{
            first: Info{a:1,b:true,c:"x"},
            second: Info{a:2,b:false,c:"y"},
            third: Info{a:3,b:true,c:"z"},
        };
    }
}