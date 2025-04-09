struct FirstStruct { a: Int; }
struct SecondStruct { b: Bool; }
struct ThirdStruct { c: String; }

struct ContainerStruct {
    one: FirstStruct;
    two: SecondStruct;
    three: ThirdStruct;
}

contract MultiStructHolder {
    data: ContainerStruct;

    init() {
        self.data = ContainerStruct{
            one: FirstStruct{a:1},
            two: SecondStruct{b:true},
            three: ThirdStruct{c:"ok"},
        };
    }
}