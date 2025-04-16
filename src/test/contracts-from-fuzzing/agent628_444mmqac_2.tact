struct Deep {
    d1: Int;
    d2: String;
    d3: Bool?;
}

struct Container {
    inner1: Deep;
    inner2: Deep;
}

contract DeepStructs {
    storage: Container;

    init() {
        self.storage = Container{
            inner1: Deep{ d1:1, d2:"a", d3:true },
            inner2: Deep{ d1:2, d2:"b", d3:null }
        };
    }
}