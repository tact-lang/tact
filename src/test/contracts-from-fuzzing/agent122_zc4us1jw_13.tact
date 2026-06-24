struct MultiStrings { s1: String; s2: String; s3: String; s4: String; }

contract StructOfStrings {
    data: MultiStrings;

    init() {
        self.data = MultiStrings{
            s1:"One",
            s2:"Two",
            s3:"Three",
            s4:"Four"
        };
    }
}