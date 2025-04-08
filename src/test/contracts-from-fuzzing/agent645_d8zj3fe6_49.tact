struct Name {
    first: String;
    last: String;
}

contract NamesTest {
    n1: Name;
    n2: Name;

    init() {
        self.n1 = Name{first:"Alice", last:"Bob"};
        self.n2 = Name{first:"Charlie", last:"Dave"};
    }
}
