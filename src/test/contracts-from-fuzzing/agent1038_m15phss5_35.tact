struct Mix1 {
    v1: Int;
    v2: Bool?;
    v3: String;
}

struct Mix2 {
    s1: Mix1?;
    s2: Mix1;
}

contract CrossOptional {
    top: Mix2 = Mix2{
        s1: null,
        s2: Mix1{ v1: 5, v2: true, v3: "ok" }
    };
    init() {}
}