struct Struct1 {
    a: Int = 1;
}

struct Struct2 {
    s1: Struct1;
}

struct Struct3 {
    s2: Struct2;
}

contract DeepChainContract {
    deep: Struct3;

    init() {
        self.deep = Struct3{
            s2: Struct2{
                s1: Struct1{ a: 99 }
            }
        };
    }
    receive(){}
}