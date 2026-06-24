struct MultipleStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract StructStrings {
    many: MultipleStrings;

    init() {
        self.many = MultipleStrings{
            s1:"one",
            s2:"two",
            s3:"three",
            s4:"four"
        };
    }
}