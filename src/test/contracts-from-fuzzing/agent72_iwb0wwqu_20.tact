struct HighlyNested {
    a: Int;
    b: Int?;
    c: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Int?;
}

struct Container {
    content: HighlyNested?;
}

contract NestOptCombo {
    box: Container;

    init() {
        self.box = Container{
            content: HighlyNested{
                a:1,
                b:null,
                c: InnerStruct{
                    x:42,
                    y:null
                }
            }
        };
    }
}