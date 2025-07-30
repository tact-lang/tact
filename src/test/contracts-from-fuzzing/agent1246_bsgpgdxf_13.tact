struct Mix {
    a: Int;
    b: Bool?;
    c: String;
    d: String?;
    e: Bool;
}

contract MixedFields {
    data: Mix;

    init() {
        self.data = Mix{
            a:42, b:null, c:"str", d:"opt", e:true
        };
    }
}