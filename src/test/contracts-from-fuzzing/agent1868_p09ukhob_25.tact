struct EmptyNested {
    s: String;
}

struct NestA {
    a: EmptyNested;
}

struct NestB {
    a: NestA;
}

contract DeepEmbed {
    deep: NestB = NestB{
        a: NestA{
            a: EmptyNested{
                s: "end"
            }
        }
    };

    init() {}
}