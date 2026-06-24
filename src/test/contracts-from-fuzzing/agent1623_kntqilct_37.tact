struct Struct0 {
    a: Int?;
    b: Bool = true;
}

struct Struct1 {
    s: Struct0;
}

struct Struct2 {
    s: Struct1;
}

struct Struct3 {
    s: Struct2;
}

contract DeepDefaultsOptionals {
    val: Struct3;
    init() {
        self.val = Struct3{
            s: Struct2{
                s: Struct1{
                    s: Struct0{ a: null }
                }
            }
        };
    }
}