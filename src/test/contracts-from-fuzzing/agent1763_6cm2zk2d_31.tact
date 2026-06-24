struct SubStruct {
    foo: Int;
    bar: Bool?;
}

struct Container {
    s1: SubStruct;
    s2: SubStruct;
}

contract TestContract {
    state: Container;

    init() {
        self.state = Container{
            s1: SubStruct{foo:1, bar:null},
            s2: SubStruct{foo:2, bar:true}
        };
    }
}