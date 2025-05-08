struct MultipleLayers {
    a: Int;
    b: Bool;
    c: String;
}

struct Container {
    m1: MultipleLayers;
    m2: MultipleLayers;
    m3: MultipleLayers;
    m4: MultipleLayers;
}

contract WideNested {
    c: Container = Container{
        m1: MultipleLayers{a:1,b:true,c:"x"},
        m2: MultipleLayers{a:2,b:false,c:"y"},
        m3: MultipleLayers{a:3,b:true,c:"z"},
        m4: MultipleLayers{a:4,b:false,c:"w"},
    };
    init() {
        self.c = Container{
            m1: MultipleLayers{a:10,b:false,c:"a"},
            m2: MultipleLayers{a:20,b:true,c:"b"},
            m3: MultipleLayers{a:30,b:false,c:"c"},
            m4: MultipleLayers{a:40,b:true,c:"d"},
        };
    }
}
