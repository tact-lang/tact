struct BigNested {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
}

struct Container {
    nested: BigNested;
    flag: Bool;
    text: String;
}

contract ManyVars {
    state: Container;

    init() {
        self.state = Container{
            nested: BigNested{
                a:1, b:2, c:3, d:4, e:5, f:6, g:7, h:8, i:9, j:10
            },
            flag: true,
            text: "hello"
        };
    }
}