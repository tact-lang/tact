struct Mix {
    foo: Int;
    bar: Bool;
    baz: String;
    qux: Int?;
    quux: Bool?;
    corge: String?;
}

contract MixContract {
    data: Mix;

    init() {
        self.data = Mix{
            foo:1,
            bar:true,
            baz:"hi",
            qux:2,
            quux:false,
            corge:null
        };
    }
}