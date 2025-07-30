struct ManyNested {
    a: Int;
    b: Bool;
    c: String;
}

struct Container1 {
    nested: ManyNested;
}

struct Container2 {
    nested: Container1;
}

struct Container3 {
    nested: Container2;
}

contract NestedContainers {
    val: Container3;

    init() {
        self.val = Container3{
            nested: Container2{
                nested: Container1{
                    nested: ManyNested{
                        a: 5,
                        b: true,
                        c: "hi"
                    }
                }
            }
        };
    }
}