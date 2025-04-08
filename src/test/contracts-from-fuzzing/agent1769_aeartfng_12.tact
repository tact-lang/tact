struct Compose1 {
    intVal: Int as int16;
    flag: Bool;
}

struct Compose2 {
    nested: Compose1;
    txt: String;
}

contract ComposedStructs {
    item: Compose2;
    
    init() {
        self.item = Compose2{
            nested: Compose1{
                intVal: -1234,
                flag: true
            },
            txt: "hello"
        };
    }
}