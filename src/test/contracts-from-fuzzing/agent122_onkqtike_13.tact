struct HasLongStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract LongStringContract {
    data: HasLongStrings;

    init() {
        self.data = HasLongStrings{
            s1: "a very long string a very long string a very long string a very long string",
            s2: "even longer string even longer string even longer string even longer string",
            s3: "ultimate longest string ultimate longest string ultimate longest string"
        };
    }
}