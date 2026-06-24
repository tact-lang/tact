struct IntStrBool {
    a: Int;
    s: String;
    b: Bool;
}

contract ManyTypesPersists {
    persist: IntStrBool;

    init() {
        self.persist = IntStrBool{
            a: 777,
            s: "world",
            b: false
        };
    }
}