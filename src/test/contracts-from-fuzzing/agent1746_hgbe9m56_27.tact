struct ABoolStr {
    i: Int;
    b: Bool;
    s: String;
}

struct Container {
    x: ABoolStr;
    y: ABoolStr;
}

contract MultiStructOpt {
    data: Container?;

    init() {
        self.data = Container{
            x: ABoolStr{i:1,b:true,s:"x"},
            y: ABoolStr{i:2,b:false,s:"y"}
        };
    }
}
