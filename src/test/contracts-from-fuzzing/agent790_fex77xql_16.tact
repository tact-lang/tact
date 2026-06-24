struct Sub {
    s1: Int;
}

struct SubContainer {
    sc1: Sub;
    sc2: Sub;
}

struct Container {
    c1: SubContainer;
    c2: SubContainer;
}

contract DeepWide {
    store: Container;
    
    init() {
        self.store = Container{
            c1: SubContainer{sc1: Sub{s1:1}, sc2: Sub{s1:2}},
            c2: SubContainer{sc1: Sub{s1:3}, sc2: Sub{s1:4}}
        };
    }
}