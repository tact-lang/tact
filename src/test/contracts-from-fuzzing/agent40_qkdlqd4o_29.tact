struct Ints {
    a: Int;
    b: Int;
    c: Int;
}

struct Bools {
    a: Bool;
    b: Bool;
    c: Bool;
}

struct Strings {
    a: String;
    b: String;
    c: String;
}

struct Container {
    ints: Ints;
    bools: Bools;
    strings: Strings;
}

contract StorageContainers {
    data: Container;

    init() {
        self.data = Container{
            ints: Ints{a:1,b:2,c:3},
            bools: Bools{a:true,b:false,c:true},
            strings: Strings{a:"a",b:"b",c:"c"}
        };
    }
}