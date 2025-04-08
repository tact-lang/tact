struct NestedStruct {
    sub:
        Inner1;
}

struct Inner1 {
    title: String;
    sub2: Inner2;
}

struct Inner2 {
    count: Int;
}

contract DeepNestedStructs {
    root: NestedStruct;

    init() {
        self.root = NestedStruct{
            sub: Inner1{
                title: "hi",
                sub2: Inner2{count: 88}
            }
        };
    }
}