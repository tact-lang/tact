struct Mix {
    a: String;
    b: Int;
    c: Bool;
    d: Address?;
}

contract MixedPersistent {
    data: Mix;

    init() {
        self.data = Mix{
            a:"hello", b:42, c:true, d:null
        };
    }

    receive() {}
}