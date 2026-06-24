struct Sub {
    aa: Int;
    ab: Bool;
    ac: String?;
}

struct Container {
    nested1: Sub;
    nested2: Sub;
    nested3: Sub;
}

contract TestContract {
    field: Container;

    init() {
        self.field = Container{
            nested1: Sub{ aa:1, ab:true, ac:"x" },
            nested2: Sub{ aa:2, ab:false, ac:null },
            nested3: Sub{ aa:3, ab:true, ac:"y" },
        };
    }
}