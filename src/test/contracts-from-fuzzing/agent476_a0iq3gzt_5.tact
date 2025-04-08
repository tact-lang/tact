struct LongNames {
    supercalifragilisticexpialidocious: Int;
    pneumonoultramicroscopicsilicovolcanoconiosis: String;
}

contract Test {
    data: LongNames;

    init() {
        self.data = LongNames{
            supercalifragilisticexpialidocious: 5,
            pneumonoultramicroscopicsilicovolcanoconiosis: "longword"
        };
    }
}
